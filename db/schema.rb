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

ActiveRecord::Schema.define(version: 20170414190956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contract_types", force: :cascade do |t|
    t.string  "name"
    t.integer "length"
  end

  create_table "dynasty_teams", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_contracts", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "dynasty_team_id"
    t.integer  "contract_type_id"
    t.integer  "first_year"
    t.boolean  "is_top_fourteen"
    t.integer  "current_salary"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "player_id",    null: false
    t.string   "esbid"
    t.string   "gsisPlayerId"
    t.string   "name"
    t.string   "position"
    t.string   "teamAbbr"
    t.integer  "stats_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.integer  "team_id",    null: false
    t.integer  "week_id",    null: false
    t.integer  "rank"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "owner",      default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "weeks", force: :cascade do |t|
    t.integer  "week_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
