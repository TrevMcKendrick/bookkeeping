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

ActiveRecord::Schema.define(version: 20140706061925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "type"
    t.string   "contra"
    t.integer  "user_id"
  end

  create_table "credits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.integer  "journal_entry_id"
    t.decimal  "amount",           precision: 10, scale: 2
  end

  create_table "debit_credit_parents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",           precision: 10, scale: 2
    t.integer  "journal_entry_id"
    t.integer  "account_id"
    t.string   "type"
  end

  create_table "debits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.integer  "journal_entry_id"
    t.decimal  "amount",           precision: 10, scale: 2
  end

  create_table "finance_accounts", force: true do |t|
    t.string   "plaid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "balance"
    t.text     "meta"
    t.string   "institution_type"
    t.string   "type"
    t.string   "access_token"
  end

  create_table "finance_institutions", force: true do |t|
    t.string   "plaid_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journal_entries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.date     "effective_date"
  end

  create_table "plutus_accounts", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.boolean  "contra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plutus_accounts", ["name", "type"], name: "index_plutus_accounts_on_name_and_type", using: :btree

  create_table "plutus_amounts", force: true do |t|
    t.string  "type"
    t.integer "account_id"
    t.integer "entry_id"
    t.decimal "amount",     precision: 20, scale: 10
  end

  add_index "plutus_amounts", ["account_id", "entry_id"], name: "index_plutus_amounts_on_account_id_and_entry_id", using: :btree
  add_index "plutus_amounts", ["entry_id", "account_id"], name: "index_plutus_amounts_on_entry_id_and_account_id", using: :btree
  add_index "plutus_amounts", ["type"], name: "index_plutus_amounts_on_type", using: :btree

  create_table "plutus_entries", force: true do |t|
    t.string   "description"
    t.integer  "commercial_document_id"
    t.string   "commercial_document_type"
    t.date     "effective_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "plutus_entries", ["commercial_document_id", "commercial_document_type"], name: "index_entries_on_commercial_doc", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
