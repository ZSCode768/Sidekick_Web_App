namespace :import do
    desc "Import Character Classes and Features from Excel"
    task character_classes: :environment do
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
  
                # Assume the class name is in a specific cell (e.g., A1)
                class_name = sheet_name
                if class_name.present?
                    # Gather features as a single description string
                    description = ""
                    capture = false
        
                    # Process features starting from a specific row (e.g., after header rows)
                    sheet.each_row_streaming(offset: 2) do |row|
                        row_text = row.map { |cell| sanitize_input(cell&.cell_value&.strip) }.compact.join(" ")

                        if !capture && row_text.match?(/\(\d+(st|nd|rd|th)\)/)
                            capture = true
                        end

                        if capture
                            if row_text.match?(/\(\d+(st|nd|rd|th)\)/)
                                description += "#{row_text.strip}\n"
                            else
                                # For description lines, add a blank line for separation
                                description += "#{row_text.strip}\n\n"
                            end 
                        end
                    end
        
                    # Create or update the CharacterClass with the concatenated description
                    CharacterClass.find_or_create_by!(name: class_name) do |character_class|
                        character_class.file_reference = file_path
                        character_class.sheet_name = sheet_name
                        character_class.description = description.strip
                    end
                else
                    puts "Class name not found in sheet #{sheet_name}. Skipping..."
                end
            else
                puts "Sheet #{sheet_name} not found. Skipping..."
            end
        end
        
        puts "Import completed successfully!"
    end

    def sanitize_input(text)
        return "" unless text

        sanitezed_text = ActionController::Base.helpers.strip_tags(text)
        sanitezed_text.gsub(/\r?\n/, "\n")
    end
end
  