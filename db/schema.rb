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

ActiveRecord::Schema.define(version: 2021_02_25_170508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aggregate_personalities", force: :cascade do |t|
    t.integer "property_id"
    t.text "mbti_types"
    t.text "interests"
    t.text "religion"
    t.text "politics"
    t.text "exercise"
    t.text "drinking"
    t.text "education_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flatmate_preferences", force: :cascade do |t|
    t.integer "property_id"
    t.string "couples"
    t.string "smoking"
    t.string "pets"
    t.string "occupation"
    t.integer "min_age"
    t.integer "max_age"
    t.string "genders"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "house_preferences", force: :cascade do |t|
    t.integer "user_id"
    t.string "smoking"
    t.string "pets"
    t.string "occupation"
    t.integer "min_age"
    t.integer "max_age"
    t.string "genders"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "individual_personalities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "aggregate_id"
    t.string "mbti_type"
    t.text "interests"
    t.string "religion"
    t.string "politics"
    t.string "exercise"
    t.string "drinking"
    t.string "education_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer "owner_id"
    t.string "title"
    t.text "blurb"
    t.string "address"
    t.string "town"
    t.string "postcode"
    t.integer "price"
    t.integer "deposit"
    t.string "bills"
    t.string "furnished"
    t.string "parking"
    t.string "outside_area"
    t.string "disabled_access"
    t.string "internet"
    t.integer "occupant_count"
    t.integer "room_count"
    t.integer "min_age"
    t.integer "max_age"
    t.string "smoking"
    t.string "pets"
    t.string "genders"
    t.string "occupations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.string "user_type"
    t.string "avatar"
    t.text "about"
    t.string "occupation"
    t.string "gender"
    t.string "couple"
    t.string "pets"
    t.string "smoking"
    t.integer "min_budget"
    t.integer "max_budget"
    t.text "areas_looking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "aggregate_personalities", "properties"
  add_foreign_key "flatmate_preferences", "properties"
  add_foreign_key "house_preferences", "users"
  add_foreign_key "individual_personalities", "aggregate_personalities", column: "aggregate_id"
  add_foreign_key "individual_personalities", "users"
  add_foreign_key "properties", "users", column: "owner_id"
end
