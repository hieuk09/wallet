# typed: false
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_021001) do

  create_table "accounts", force: :cascade do |t|
    t.integer "initial_balance_cents", default: 0, null: false
    t.string "initial_balance_currency", default: "USD", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_type", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.string "from_code", null: false
    t.string "to_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "import_transactions", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "category_id", null: false
    t.integer "import_id", null: false
    t.string "description", null: false
    t.datetime "paid_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "VND", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_import_transactions_on_account_id"
    t.index ["category_id"], name: "index_import_transactions_on_category_id"
    t.index ["import_id"], name: "index_import_transactions_on_import_id"
  end

  create_table "imports", force: :cascade do |t|
    t.string "name", null: false
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_imports_on_account_id"
  end

  create_table "sub_transactions", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "VND", null: false
    t.text "description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_transactions_on_category_id"
    t.index ["transaction_id"], name: "index_sub_transactions_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "category_id"
    t.integer "account_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.datetime "paid_at"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ignored", default: false, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["paid_at"], name: "index_transactions_on_paid_at"
  end

  add_foreign_key "import_transactions", "accounts"
  add_foreign_key "import_transactions", "categories"
  add_foreign_key "import_transactions", "imports"
  add_foreign_key "imports", "accounts"
end
