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

ActiveRecord::Schema.define(version: 2021_03_23_212219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aggregate_personalities", force: :cascade do |t|
    t.bigint "individual_personality_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["individual_personality_id"], name: "index_aggregate_personalities_on_individual_personality_id"
    t.index ["property_id"], name: "index_aggregate_personalities_on_property_id"
  end

  create_table "flatmate_preferences", force: :cascade do |t|
    t.integer "property_id"
    t.string "couples"
    t.string "smoking"
    t.text "pets", default: [], array: true
    t.string "occupation"
    t.integer "min_age"
    t.integer "max_age"
    t.string "genders"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_flatmate_preferences_on_property_id"
  end

  create_table "house_preferences", force: :cascade do |t|
    t.integer "user_id"
    t.string "smoking"
    t.text "pets", default: [], array: true
    t.string "occupation"
    t.integer "min_age"
    t.integer "max_age"
    t.string "genders"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_house_preferences_on_user_id"
  end

  create_table "individual_personalities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "aggregate_id"
    t.string "mbti_type"
    t.text "interests", default: [], array: true
    t.string "religion"
    t.string "politics", default: [], array: true
    t.string "exercise"
    t.string "drinking"
    t.string "education_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aggregate_id"], name: "index_individual_personalities_on_aggregate_id"
    t.index ["user_id"], name: "index_individual_personalities_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "aggregate_id"
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
    t.text "pets", default: [], array: true
    t.string "genders", default: [], array: true
    t.string "occupations", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aggregate_id"], name: "index_properties_on_aggregate_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
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
    t.text "pets", default: [], array: true
    t.string "smoking"
    t.integer "min_budget"
    t.integer "max_budget"
    t.text "areas_looking", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "dob"
    t.string "advertiser_type"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "aggregate_personalities", "individual_personalities"
  add_foreign_key "aggregate_personalities", "properties"
  add_foreign_key "flatmate_preferences", "properties"
  add_foreign_key "house_preferences", "users"
  add_foreign_key "individual_personalities", "users"
  add_foreign_key "properties", "users", column: "owner_id"
end
