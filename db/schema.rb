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

ActiveRecord::Schema.define(version: 20180205113930) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "initial_balance_cents",    default: 0,     null: false
    t.string   "initial_balance_currency", default: "USD", null: false
    t.string   "name"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_type", null: false
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.string   "from_code"
    t.string   "to_code"
    t.float    "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_transactions", force: :cascade do |t|
    t.integer  "transaction_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "VND", null: false
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "sub_transactions", ["category_id"], name: "index_sub_transactions_on_category_id"
  add_index "sub_transactions", ["transaction_id"], name: "index_sub_transactions_on_transaction_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "account_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.datetime "paid_at"
    t.string   "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"
  add_index "transactions", ["category_id"], name: "index_transactions_on_category_id"

end
