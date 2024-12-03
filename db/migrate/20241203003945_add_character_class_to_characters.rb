class AddCharacterClassToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_reference :characters, :character_class, foreign_key: true
  end
end
