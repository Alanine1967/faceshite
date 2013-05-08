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

ActiveRecord::Schema.define(version: 20130508203653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "missives", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "recipient"
  end

  add_index "missives", ["title"], name: "index_missives_on_title", using: :btree
  add_index "missives", ["user_id"], name: "index_missives_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "user_id",         null: false
    t.integer  "acquaintance_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["acquaintance_id"], name: "index_relationships_on_acquaintance_id", using: :btree
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "surname"
  end

  add_index "users", ["first_name", "surname"], name: "index_users_on_first_name_and_surname", using: :btree

end
