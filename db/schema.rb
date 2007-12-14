# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
    t.datetime "created_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "held_at"
    t.datetime "published_at"
    t.string   "city"
    t.integer  "jam_slots"
    t.date     "jam_registration_starts_on"
    t.integer  "rsvp_slots"
    t.date     "rsvp_registration_starts_on"
  end

  create_table "identity_urls", :force => true do |t|
    t.integer "user_id"
    t.text    "url"
  end

  create_table "jam_proposals", :force => true do |t|
    t.integer "user_id"
    t.text    "title"
    t.text    "description"
  end

  create_table "jams", :force => true do |t|
    t.integer "event_id"
    t.string  "title"
    t.text    "description"
  end

  create_table "jams_users", :id => false, :force => true do |t|
    t.integer "jam_id"
    t.integer "user_id"
  end

  create_table "mugshots", :force => true do |t|
    t.integer  "temp_user_id"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.binary  "server_url"
    t.string  "handle"
    t.binary  "secret"
    t.integer "issued"
    t.integer "lifetime"
    t.string  "assoc_type"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.string  "nonce"
    t.integer "created"
  end

  create_table "open_id_authentication_settings", :force => true do |t|
    t.string "setting"
    t.binary "value"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.string   "permalink"
  end

  create_table "rsvps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "nick_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "show_upcoming_rsvps",       :default => true, :null => false
    t.boolean  "show_past_rsvps",           :default => true, :null => false
    t.string   "full_name"
    t.text     "website_url"
    t.string   "website_name"
    t.string   "permalink"
  end

end
