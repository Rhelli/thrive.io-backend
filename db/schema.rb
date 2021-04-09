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

ActiveRecord::Schema.define(version: 2021_04_09_170817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "disabled_access"
    t.string "internet"
    t.integer "occupant_count"
    t.integer "room_count"
    t.integer "min_age"
    t.integer "max_age"
    t.string "smoking"
    t.string "outside_area", default: [], array: true
    t.text "pets", default: [], array: true
    t.string "genders", default: [], array: true
    t.string "occupations", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aggregate_id"], name: "index_properties_on_aggregate_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "shortlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "property_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_shortlists_on_property_id"
    t.index ["user_id", "property_id"], name: "index_shortlists_on_user_id_and_property_id", unique: true
    t.index ["user_id"], name: "index_shortlists_on_user_id"
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

  add_foreign_key "properties", "users", column: "owner_id"
end
