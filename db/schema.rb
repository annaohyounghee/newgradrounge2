# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181023204340) do

  create_table "awards", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "image"
    t.index ["profile_id"], name: "index_awards_on_profile_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commentable_type"
    t.integer "commentable_id"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_comments_on_ancestry"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "school"
    t.string "degree"
    t.string "field_of_study"
    t.string "grade"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.integer "from_date"
    t.integer "to_date"
    t.index ["profile_id"], name: "index_educations_on_profile_id"
  end

  create_table "eventcomments", force: :cascade do |t|
    t.text "content"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eventcommentable_type"
    t.integer "eventcommentable_id"
    t.integer "user_id"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_eventcomments_on_ancestry"
    t.index ["event_id"], name: "index_eventcomments_on_event_id"
    t.index ["eventcommentable_id"], name: "index_eventcomments_on_eventcommentable_id"
    t.index ["eventcommentable_type"], name: "index_eventcomments_on_eventcommentable_type"
    t.index ["user_id"], name: "index_eventcomments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "e_num"
    t.string "e_writer"
    t.string "title"
    t.datetime "e_time"
    t.text "e_address"
    t.string "e_postal"
    t.text "e_detail"
    t.datetime "e_writetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "e_type"
    t.string "e_audience"
    t.string "e_interest"
    t.string "e_taglist"
    t.string "avatar"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.date "from_date"
    t.date "to_date"
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "goings", force: :cascade do |t|
    t.integer "user"
    t.integer "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_conversations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_conversations_users", id: false, force: :cascade do |t|
    t.integer "conversation_id"
    t.integer "user_id"
    t.index ["conversation_id"], name: "index_group_conversations_users_on_conversation_id"
    t.index ["user_id"], name: "index_group_conversations_users_on_user_id"
  end

  create_table "group_messages", force: :cascade do |t|
    t.string "content"
    t.string "added_new_users"
    t.string "seen_by"
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_group_messages_on_conversation_id"
    t.index ["user_id"], name: "index_group_messages_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "pins", force: :cascade do |t|
    t.integer "user"
    t.integer "reachout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_conversations", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id", "sender_id"], name: "index_private_conversations_on_recipient_id_and_sender_id", unique: true
    t.index ["recipient_id"], name: "index_private_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_private_conversations_on_sender_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "conversation_id"
    t.boolean "seen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_private_messages_on_conversation_id"
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reachouts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "back_story"
    t.string "reachout_type"
    t.string "audience"
    t.string "interest"
    t.string "format"
    t.string "duration"
    t.date "reachout_when"
    t.string "reachout_where"
    t.string "compensation"
    t.string "mescellaneous"
    t.integer "user_id"
    t.index ["user_id"], name: "index_reachouts_on_user_id"
  end

  create_table "researches", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_researches_on_profile_id"
  end

  create_table "saves", force: :cascade do |t|
    t.integer "user"
    t.integer "reachout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shares", force: :cascade do |t|
    t.integer "user"
    t.integer "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "faculty"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
