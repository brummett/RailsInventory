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

ActiveRecord::Schema.define(version: 20160312221639) do

  create_table "items", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "sku"
    t.string   "barcode"
    t.integer  "cost_cents",  default: 0
    t.integer  "price_cents", default: 0
    t.string   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "items", ["barcode"], name: "index_items_on_barcode", unique: true
  add_index "items", ["sku"], name: "index_items_on_sku", unique: true

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phonenumber"
    t.string   "email"
    t.string   "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "warehouses", ["name"], name: "index_warehouses_on_name", unique: true

end
