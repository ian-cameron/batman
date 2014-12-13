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

ActiveRecord::Schema.define(version: 20141208192212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.boolean  "admin"
  end

  create_table "deployments", force: true do |t|
    t.integer  "project_id"
    t.integer  "device_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "start_voltage"
    t.float    "end_voltage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "deployed_in"
    t.integer  "client_id"
  end

  create_table "device_types", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "client_id"
    t.integer  "type_id"
    t.string   "name"
    t.datetime "purchased_on"
    t.datetime "retired_on"
    t.text     "notes"
    t.float    "voltage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
