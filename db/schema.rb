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

ActiveRecord::Schema.define(version: 20150820021047) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "derby_events", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.string   "venue"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "host"
    t.string   "website"
    t.string   "event_contact"
    t.string   "cost"
    t.boolean  "mrda"
    t.boolean  "wftda"
    t.boolean  "jrda"
    t.boolean  "made"
    t.boolean  "usars"
    t.boolean  "rdcl"
    t.boolean  "female"
    t.boolean  "male"
    t.boolean  "coed"
    t.boolean  "preregistration"
    t.boolean  "spectators"
    t.text     "general_info"
    t.string   "submission_contact"
    t.boolean  "approved",           default: false
    t.boolean  "deleted",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "open_practices", force: :cascade do |t|
    t.string   "league_name"
    t.string   "league_website"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "venue"
    t.string   "cost"
    t.boolean  "monday"
    t.time     "monday_start"
    t.time     "monday_end"
    t.boolean  "tuesday"
    t.time     "tuesday_start"
    t.time     "tuesday_end"
    t.boolean  "wednesday"
    t.time     "wednesday_start"
    t.time     "wednesday_end"
    t.boolean  "thursday"
    t.time     "thursday_start"
    t.time     "thursday_end"
    t.boolean  "friday"
    t.time     "friday_start"
    t.time     "friday_end"
    t.boolean  "saturday"
    t.time     "saturday_start"
    t.time     "saturday_end"
    t.boolean  "sunday"
    t.time     "sunday_start"
    t.time     "sunday_end"
    t.string   "practice_contact"
    t.string   "submission_contact"
    t.boolean  "approved",           default: false
    t.boolean  "deleted",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
