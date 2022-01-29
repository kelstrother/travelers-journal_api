ActiveRecord::Schema.define(version: 2022_01_28_035340) do

  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string "galaxy"
    t.string "region"
    t.string "glyphs"
    t.string "planets"
    t.string "dominant_lifeform"
    t.string "economy"
    t.string "conflict_level"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "entries", "users"
end
