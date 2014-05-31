# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140505051138) do

  create_table "constraints", force: true do |t|
    t.integer  "story_id"
    t.string   "title"
    t.string   "text"
    t.integer  "constraint_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.integer  "story_id"
    t.integer  "source"
    t.integer  "target"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "story_id"
    t.integer  "weight"
    t.boolean  "truth"
    t.integer  "constraint_num"
    t.integer  "constraint_id"
    t.string   "annotation"
    t.integer  "truth_height",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "stories", force: true do |t|
    t.integer  "user_id"
    t.string   "summary"
    t.string   "title"
    t.string   "genre"
    t.integer  "test_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "salt"
    t.integer  "test_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
