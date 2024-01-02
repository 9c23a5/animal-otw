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

ActiveRecord::Schema[7.1].define(version: 2024_01_02_041522) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_of_the_weeks", force: :cascade do |t|
    t.datetime "date_start", precision: nil
    t.datetime "date_end", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "animal_id", null: false
    t.index ["animal_id"], name: "index_animal_of_the_weeks_on_animal_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "wikipedia_link"
    t.text "wikipedia_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_animals_on_name", unique: true
  end

  add_foreign_key "animal_of_the_weeks", "animals", on_delete: :cascade
end
