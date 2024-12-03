namespace :db do
    desc "Import Spells from JSON files"
    task import_spells: :environment do
        require 'json'

        json_dir = Rails.root.join('app', 'assets', 'jsons')
        files = Dir.glob(json_dir.join('*.json'))

        files.each do |file_path|
            class_name = File.basename(file_path, '.json').split('_spells').first.titleize
            character_class = CharacterClass.find_by(name: class_name)

            if character_class.nil?
                puts "Character class '#{class_name}' not found. Skipping #{file_path}."
                next
            end

            puts "Importing spells for #{class_name} from #{File.basename(file_path)}..."

            json_data = JSON.parse(File.read(file_path))

            json_data.each do |spell_data|
                Spell.create!(
                    name: spell_data['name'],
                    level: spell_data['level'],
                    casting_time: spell_data.dig('time', 0, 'number').to_s + " " + spell_data.dig('time', 0, 'unit'),
                    duration: spell_data.dig('duration', 0, 'type') || 'Instant',
                    school: spell_data['school'],
                    range: if spell_data.dig('range', 'distance')
                        "#{spell_data.dig('range', 'distance', 'amount')} #{spell_data.dig('range', 'distance', 'type')}".strip
                    else
                        spell_data.dig('range', 'type') || 'Self'
                    end,
                    components: (spell_data.dig('components', 'v') ? 'V' : '') +
                                (spell_data.dig('components', 's') ? ' S' : '') +
                                (spell_data.dig('components', 'm') ? ' M' : ''),
                    description: clean_text(spell_data['entries'].join("\n")),
                    at_higher_levels: clean_text(spell_data['entriesHigherLevels']&.join("\n") || ''),
                    character_class_id: character_class.id
                    )
            end
            puts "Finished importing spells for #{class_name}."
        end
        puts "All spell files have been processed!"
    end

    def clean_text(text)
        text.gsub(/{@condition (\w+)}/, '\1')
            .gsub(/{@damage ([\d]+d[\d]+)}/, '\1 damage')
            .gsub(/{@creature (\w+)}/, '\1')
            .gsub(/{@skill (\w+)}/, '\1 skill')
    end
end
    