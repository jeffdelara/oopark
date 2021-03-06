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

ActiveRecord::Schema.define(version: 2022_02_20_081622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_sizes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "plate_number"
    t.bigint "car_size_id", null: false
    t.datetime "in"
    t.datetime "out"
    t.integer "parking_slot_id"
    t.integer "entry_point_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_size_id"], name: "index_cars_on_car_size_id"
  end

  create_table "entry_points", force: :cascade do |t|
    t.string "name"
    t.integer "x"
    t.integer "y"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string "plate_number", null: false
    t.bigint "car_size_id", null: false
    t.datetime "time_in"
    t.datetime "time_out"
    t.integer "parking_slot_id"
    t.integer "lot_size_id"
    t.integer "entry_point_id"
    t.float "hours_parked"
    t.float "flat_rate_charge"
    t.float "continuous_rate_charge"
    t.float "lot_size_charge"
    t.float "total_charge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_size_id"], name: "index_histories_on_car_size_id"
  end

  create_table "lot_sizes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.float "rate_per_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parking_slots", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.bigint "lot_size_id", null: false
    t.boolean "vacant", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lot_size_id"], name: "index_parking_slots_on_lot_size_id"
  end

  add_foreign_key "cars", "car_sizes"
  add_foreign_key "histories", "car_sizes"
  add_foreign_key "parking_slots", "lot_sizes"
end
