ActiveRecord::Schema.define(version: 2021_04_06_125828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.text "content"
    t.boolean "is_disclosed", default: false
    t.bigint "meeting_room_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_room_id"], name: "index_chats_on_meeting_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_favorites_on_chat_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "meeting_rooms", force: :cascade do |t|
    t.string "name"
    t.integer "leader_id"
    t.string "meeting_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.bigint "chat_id", null: false
    t.integer "action", null: false
    t.boolean "is_checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_notifications_on_chat_id"
    t.index ["receiver_id"], name: "index_notifications_on_receiver_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
  end

  create_table "room_users", force: :cascade do |t|
    t.bigint "meeting_room_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_room_id"], name: "index_room_users_on_meeting_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "meeting_rooms"
  add_foreign_key "chats", "users"
  add_foreign_key "favorites", "chats"
  add_foreign_key "favorites", "users"
  add_foreign_key "notifications", "chats"
  add_foreign_key "room_users", "meeting_rooms"
  add_foreign_key "room_users", "users"
end
