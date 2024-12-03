class CreateCharacterClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :character_classes do |t|
      t.string :name
      t.text :description
      t.string :file_reference

      t.timestamps
    end
  end
end
