# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_09_051613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
  end

  create_table "cleared_payments", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.bigint "transaction_id", null: false, comment: "Can reference multiple payments"
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.index ["payment_id"], name: "cleared_payments_payment_id_key", unique: true
  end

  create_table "families", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.index ["name"], name: "families_name_key", unique: true
  end

  create_table "members", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "family_id", null: false
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "email", limit: 100
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.index ["email"], name: "members_email_key", unique: true
    t.index ["first_name", "last_name"], name: "members_full_name_uidx", unique: true
  end

  create_table "memberships", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "family_id", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.index ["family_id", "season_id"], name: "memberships_uniq_registration_uidx", unique: true
  end

  create_table "payment_types", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
  end

  create_table "payments", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "membership_id", null: false
    t.datetime "assigned_on", null: false
    t.bigint "payment_type_id", null: false
    t.decimal "amount", precision: 19, scale: 2, null: false
    t.text "notes"
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.index ["membership_id"], name: "payments_membership_id_idx"
  end

  create_table "seasons", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.datetime "starts_on", null: false
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
  end

  create_table "transactions", id: :bigint, default: nil, force: :cascade do |t|
    t.datetime "cleared_on", null: false
    t.decimal "amount", precision: 19, scale: 2, null: false
    t.text "descr", null: false
    t.datetime "created_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
    t.datetime "updated_at", default: -> { "timezone('UTC'::text, CURRENT_TIMESTAMP)" }, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "users_email_uidx", unique: true
    t.index ["first_name", "last_name"], name: "users_full_name_uidx", unique: true
  end

  add_foreign_key "cleared_payments", "payments", name: "cleared_payments_payment_id_fkey"
  add_foreign_key "cleared_payments", "transactions", name: "cleared_payments_transaction_id_fkey"
  add_foreign_key "members", "families", name: "members_family_id_fkey"
  add_foreign_key "memberships", "families", name: "memberships_family_id_fkey"
  add_foreign_key "memberships", "seasons", name: "memberships_season_id_fkey"
  add_foreign_key "payments", "memberships", name: "payments_membership_id_fkey"
  add_foreign_key "payments", "payment_types", name: "payments_payment_type_id_fkey"
  add_foreign_key "seasons", "activities", name: "seasons_activity_id_fkey"
end
