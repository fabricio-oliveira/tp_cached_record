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

ActiveRecord::Schema.define(version: 20170315232801) do

  create_table "bars", force: :cascade do |t|
    t.string   "other"
    t.string   "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bars", ["uuid"], name: "index_bars_on_uuid", unique: true

  create_table "foos", force: :cascade do |t|
    t.string   "other"
    t.string   "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "foos", ["other"], name: "index_foos_on_other", unique: true
  add_index "foos", ["uuid"], name: "index_foos_on_uuid", unique: true

  create_table "pepes", force: :cascade do |t|
    t.string   "other"
    t.string   "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pepes", ["uuid"], name: "index_pepes_on_uuid", unique: true

end
