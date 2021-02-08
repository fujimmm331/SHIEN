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

ActiveRecord::Schema.define(version: 2021_02_02_035603) do

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "vehicle_number"
    t.string "transport_bureau"
    t.integer "class_number"
    t.string "registration_type"
    t.string "registration_number"
    t.integer "vehicle_inspection_day"
    t.integer "registered_year"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_cars_on_customer_id"
  end

  create_table "contact_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "status"
    t.text "comment", null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_contact_logs_on_customer_id"
    t.index ["team_id"], name: "index_contact_logs_on_team_id"
    t.index ["user_id"], name: "index_contact_logs_on_user_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "kana_name", null: false
    t.string "email"
    t.string "phone_number", null: false
    t.string "cell_phone_number", null: false
    t.string "postal_code", null: false
    t.string "municipality", null: false
    t.string "address", null: false
    t.string "building"
    t.string "hobby"
    t.text "memo"
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_customers_on_team_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "visiter_id", null: false
    t.integer "visited_id", null: false
    t.bigint "customer_id"
    t.bigint "contact_log_id"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_log_id"], name: "index_notifications_on_contact_log_id"
    t.index ["customer_id"], name: "index_notifications_on_customer_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "team_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "contact_logs", "customers"
  add_foreign_key "contact_logs", "teams"
  add_foreign_key "contact_logs", "users"
  add_foreign_key "customers", "teams"
  add_foreign_key "customers", "users"
  add_foreign_key "notifications", "contact_logs"
  add_foreign_key "notifications", "customers"
  add_foreign_key "users", "teams"
end
