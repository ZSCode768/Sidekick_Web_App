# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_03_003945) do
  create_table "character_classes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "file_reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sheet_name"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.text "abilities"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "character_class_id"
    t.index ["character_class_id"], name: "index_characters_on_character_class_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.string "casting_time"
    t.string "duration"
    t.string "school"
    t.string "range"
    t.string "components"
    t.text "description"
    t.text "at_higher_levels"
    t.integer "character_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_class_id"], name: "index_spells_on_character_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characters", "character_classes"
  add_foreign_key "characters", "users"
  add_foreign_key "spells", "character_classes"
end
