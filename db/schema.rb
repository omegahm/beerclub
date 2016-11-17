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

ActiveRecord::Schema.define(version: 20161117140755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bills", ["created_at"], name: "index_bills_on_created_at", using: :btree
  add_index "bills", ["product_id"], name: "index_bills_on_product_id", using: :btree
  add_index "bills", ["user_id"], name: "index_bills_on_user_id", using: :btree

  create_table "meta", force: :cascade do |t|
    t.float    "cash"
    t.float    "loss"
    t.float    "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.boolean  "visible",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width",      default: 130
  end

  add_index "products", ["created_at"], name: "index_products_on_created_at", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["visible"], name: "index_products_on_visible", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "room"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",    default: true
  end

  add_index "users", ["created_at"], name: "index_users_on_created_at", using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["room"], name: "index_users_on_room", using: :btree
  add_index "users", ["visible"], name: "index_users_on_visible", using: :btree

end
