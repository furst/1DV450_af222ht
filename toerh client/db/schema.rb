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

ActiveRecord::Schema.define(version: 20140314153035) do

  create_table "apiusers", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "access_token"
    t.datetime "today",           default: '2014-04-02 04:33:35'
    t.boolean  "is_admin",        default: false
    t.boolean  "blocked",         default: false
    t.integer  "count",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "url"
    t.integer  "resource_type_id"
    t.integer  "license_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["license_id"], name: "index_resources_on_license_id"
  add_index "resources", ["resource_type_id"], name: "index_resources_on_resource_type_id"
  add_index "resources", ["user_id"], name: "index_resources_on_user_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["resource_id"], name: "index_taggings_on_resource_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.string   "auth_token"
    t.datetime "token_expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
