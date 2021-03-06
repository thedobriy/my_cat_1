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

ActiveRecord::Schema.define(version: 20141224204038) do

  create_table "cabinets", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "adress"
    t.string   "desc"
    t.string   "shedule"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "cabinets", ["name", "company_id"], name: "index_cabinets_on_name_and_company_id"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.integer  "pop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "companies_count"
    t.integer  "doctors_count"
    t.integer  "cabinets_count"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "adress"
    t.string   "contacts"
    t.string   "site"
    t.integer  "type_company_id"
    t.integer  "main_doctor_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "contacts"
    t.integer  "company_id"
    t.integer  "speciality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "doctors", ["name", "company_id", "speciality_id"], name: "index_doctors_on_name_and_company_id_and_speciality_id"

  create_table "specialities", force: true do |t|
    t.string   "name"
    t.integer  "doctors_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
