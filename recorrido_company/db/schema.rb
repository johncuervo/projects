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

ActiveRecord::Schema[7.1].define(version: 2024_07_12_005038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_schedules", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "start_hour", null: false
    t.datetime "end_hour", null: false
    t.string "day_of_week", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_schedules_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_assignments", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "supporter_employee_id", null: false
    t.bigint "client_schedule_id", null: false
    t.datetime "time", null: false
    t.boolean "confirmed_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_schedule_assignments_on_client_id"
    t.index ["client_schedule_id"], name: "index_schedule_assignments_on_client_schedule_id"
    t.index ["supporter_employee_id"], name: "index_schedule_assignments_on_supporter_employee_id"
  end

  create_table "supporter_employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "assigned_color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_schedules", "clients"
  add_foreign_key "schedule_assignments", "client_schedules"
  add_foreign_key "schedule_assignments", "clients"
  add_foreign_key "schedule_assignments", "supporter_employees"
end
