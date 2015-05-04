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

ActiveRecord::Schema.define(version: 20150430021443) do

  create_table "patients", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "address",         limit: 255
    t.date     "birth"
    t.string   "phone",           limit: 255
    t.string   "birthplace",      limit: 255
    t.string   "civilstate",      limit: 255
    t.string   "skin",            limit: 255
    t.boolean  "special_patient", limit: 1
    t.string   "email",           limit: 255
    t.string   "sex",             limit: 255
    t.text     "obs",             limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
