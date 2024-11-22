class AddStatsAndDescriptionToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :description, :text
    add_column :characters, :strength, :integer
    add_column :characters, :dexterity, :integer
    add_column :characters, :constitution, :integer
    add_column :characters, :intelligence, :integer
    add_column :characters, :wisdom, :integer
    add_column :characters, :charisma, :integer
  end
end
