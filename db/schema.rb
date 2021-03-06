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

ActiveRecord::Schema.define(version: 20150528171815) do

  create_table "apps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "app_id"
    t.index ["app_id"], name: "index_apps_on_app_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "value"
    t.text     "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "keyword_id"
    t.integer  "app_id"
    t.text     "term"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_matches_on_app_id"
    t.index ["keyword_id"], name: "index_matches_on_keyword_id"
  end

end
