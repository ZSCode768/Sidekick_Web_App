class AddSheetNameToCharacterClasses < ActiveRecord::Migration[7.1]
  def change
    add_column :character_classes, :sheet_name, :string
  end
end
