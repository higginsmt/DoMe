ActiveRecord::Schema.define(version: 20140302203410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.text     "name"
    t.text     "blurb"
    t.text     "url"
    t.text     "things_needed", default: [], array: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "adventures", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.date     "date_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adventures", ["activity_id"], name: "index_adventures_on_activity_id", using: :btree
  add_index "adventures", ["user_id"], name: "index_adventures_on_user_id", using: :btree

  create_table "stories", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "adventure_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["activity_id"], name: "index_stories_on_activity_id", using: :btree
  add_index "stories", ["adventure_id"], name: "index_stories_on_adventure_id", using: :btree
  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
