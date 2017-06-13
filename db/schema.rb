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

ActiveRecord::Schema.define(version: 20170613154809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true, using: :btree
  end

  create_table "keys", force: :cascade do |t|
    t.string   "keyword",    null: false
    t.integer  "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword", "number"], name: "index_keys_on_keyword_and_number", unique: true, using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.datetime "creation_date"
    t.datetime "expiry_date"
    t.boolean  "enabled"
    t.float    "project_cost"
    t.string   "project_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["project_cost"], name: "index_projects_on_project_cost", using: :btree
    t.index ["project_name"], name: "index_projects_on_project_name", unique: true, using: :btree
  end

  create_table "target_countries", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "country_id"], name: "index_target_countries_on_project_id_and_country_id", unique: true, using: :btree
  end

  create_table "target_keys", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "key_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "key_id"], name: "index_target_keys_on_project_id_and_key_id", unique: true, using: :btree
  end

end
