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

ActiveRecord::Schema.define(version: 20160312234130) do

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.boolean  "is_taxable"
    t.string   "phone_number"
    t.string   "alternate_phone_number"
    t.string   "email"
    t.string   "notes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

  create_table "order_items", force: :cascade do |t|
    t.integer  "cost_cents", default: 0, null: false
    t.integer  "count",                  null: false
    t.string   "barcode",                null: false
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.string   "order_number"
    t.string   "order_type"
    t.integer  "customer_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["warehouse_id"], name: "index_orders_on_warehouse_id"

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
