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

ActiveRecord::Schema[7.1].define(version: 2024_05_17_021379) do
  create_table "calagator_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "name", null: false
    t.string "display_name"
    t.index ["email"], name: "index_calagator_users_on_email", unique: true
    t.index ["name"], name: "index_calagator_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_calagator_users_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time", precision: nil
    t.integer "venue_id"
    t.string "url"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "source_id"
    t.integer "duplicate_of_id"
    t.datetime "end_time", precision: nil
    t.string "rrule"
    t.text "venue_details"
    t.boolean "locked", default: false
    t.string "created_by_name"
    t.integer "created_by_id"
    t.index ["created_by_id"], name: "index_events_on_created_by_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "imported_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "created_by_name"
    t.integer "created_by_id"
    t.index ["created_by_id"], name: "index_sources_on_created_by_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "taggable_id", null: false
    t.string "taggable_type", null: false
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context"
    t.datetime "created_at", precision: nil
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "address"
    t.string "url"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "street_address"
    t.string "locality"
    t.string "region"
    t.string "postal_code"
    t.string "country"
    t.decimal "latitude", precision: 7, scale: 4
    t.decimal "longitude", precision: 7, scale: 4
    t.string "email"
    t.string "telephone"
    t.integer "source_id"
    t.integer "duplicate_of_id"
    t.boolean "closed", default: false
    t.boolean "wifi", default: false
    t.text "access_notes"
    t.integer "events_count"
    t.string "created_by_name"
    t.integer "created_by_id"
    t.index ["created_by_id"], name: "index_venues_on_created_by_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at", precision: nil
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "events", "calagator_users", column: "created_by_id"
  add_foreign_key "sources", "calagator_users", column: "created_by_id"
  add_foreign_key "venues", "calagator_users", column: "created_by_id"
end
