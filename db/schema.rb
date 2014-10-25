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

ActiveRecord::Schema.define(version: 20141025161756) do

  create_table "polls", force: true do |t|
    t.string   "location_name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polls", ["latitude", "longitude"], :name => "index_polls_on_latitude_and_longitude"

  create_table "reports", force: true do |t|
    t.string   "election_id"
    t.text     "problems"
    t.text     "comment"
    t.string   "contact_method"
    t.time     "time_happened"
    t.date     "election_year"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["poll_id"], :name => "index_reports_on_poll_id"

end
