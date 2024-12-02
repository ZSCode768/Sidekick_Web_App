namespace :import do
    desc "Import Character Classes from Excel"
    task character_class: :environment do
        file_path = 'app/assets/excelsheets/Sidekick_Character_Sheet.xlsx'

        spreadsheet = Roo::Spreadsheet.open(file_path)

        sheets_to_import = [
            'Battle Rager', 'Eldritch Vessel', 'Guardian', 'Healer', 
            'Mage', 'Martial Artist', 'Minstrel', 'Sneak', 
            'Spellborn', 'Strider', 'Warrior', 'Wildkeeper'
        ]

        sheets_to_import.each do |sheet_name|
            if spreadsheet.sheets.include?(sheet_name)
                sheet = spreadsheet.sheet(sheet_name)

                puts "Processing sheet: #{sheet_name}"

                sheet.each_row_streaming(offset: 1) do |row|
                    name = row[0].cell_value
                    description = row[1].cell_value

                    if name.present? && description.present?
                        CharacterClass.find_or_create_by!(name: name) do |character_class|
                            character_class.description = description
                            character_class.file_reference = file_path
                            character_class.sheet_name = sheet_name
                        end
                    end
                end
            else
                puts "Sheet #{sheet_name} not found. Skipping..."
            end
        end

        puts "Import completed successfully!"

    end
end