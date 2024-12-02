class CreateSpells < ActiveRecord::Migration[7.1]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :level
      t.string :casting_time
      t.string :duration
      t.string :school
      t.string :range
      t.string :components
      t.text :description
      t.text :at_higher_levels
      t.references :character_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
