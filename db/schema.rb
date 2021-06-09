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

ActiveRecord::Schema.define(version: 2021_06_09_192248) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "days", force: :cascade do |t|
    t.string "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delivermen", force: :cascade do |t|
    t.string "cnh"
    t.string "vehicle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_delivermen_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.integer "owner_id", null: false
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "open_at"
    t.time "close_at"
    t.index ["address_id"], name: "index_restaurants_on_address_id"
    t.index ["owner_id"], name: "index_restaurants_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.string "phone"
    t.string "cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "address_id", null: false
    t.integer "role"
    t.string "validation_token"
    t.boolean "has_validated", default: false
    t.datetime "validation_token_expiry_at"
    t.integer "times_logged", default: 0, null: false
    t.datetime "last_login"
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  create_table "work_days", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_work_days_on_day_id"
    t.index ["restaurant_id"], name: "index_work_days_on_restaurant_id"
  end

  add_foreign_key "delivermen", "users"
  add_foreign_key "restaurants", "addresses"
  add_foreign_key "restaurants", "users", column: "owner_id"
  add_foreign_key "users", "addresses"
  add_foreign_key "work_days", "days"
  add_foreign_key "work_days", "restaurants"
end
