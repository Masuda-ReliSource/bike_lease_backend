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

ActiveRecord::Schema[7.0].define(version: 2023_03_01_144907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.integer "status"
    t.integer "role_type"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
  end

  create_table "bike_leases", force: :cascade do |t|
    t.json "leese", default: {}
    t.json "closee", default: {}
    t.decimal "down_payment", precision: 12, scale: 2, default: "0.0"
    t.integer "lease_status", default: 0
    t.datetime "approved_at"
    t.bigint "bike_id", null: false
    t.bigint "dealer_id", null: false
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_bike_leases_on_admin_user_id"
    t.index ["bike_id"], name: "index_bike_leases_on_bike_id"
    t.index ["dealer_id"], name: "index_bike_leases_on_dealer_id"
  end

  create_table "bikes", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "year"
    t.integer "mileage"
    t.bigint "dealer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dealer_id"], name: "index_bikes_on_dealer_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.bigint "admin_user_id", null: false
    t.index ["admin_user_id"], name: "index_dealers_on_admin_user_id"
  end

  add_foreign_key "bike_leases", "admin_users"
  add_foreign_key "bike_leases", "bikes"
  add_foreign_key "bike_leases", "dealers"
  add_foreign_key "bikes", "dealers"
  add_foreign_key "dealers", "admin_users"
end
