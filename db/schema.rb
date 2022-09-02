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

ActiveRecord::Schema[7.0].define(version: 2022_08_31_165217) do
  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "tour_id", null: false
    t.integer "insales_order"
    t.string "email"
    t.string "name"
    t.integer "quantity"
    t.integer "days"
    t.string "trans"
    t.string "hotel"
    t.string "eat"
    t.integer "room_two"
    t.integer "rooms_three"
    t.integer "rooms_four"
    t.string "excursion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_orders_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "contry"
    t.string "city"
    t.integer "cost"
    t.integer "hotel_lux"
    t.integer "hotel_standart"
    t.integer "hotel_budget"
    t.integer "cost_eat"
    t.integer "transfer"
    t.integer "excursion"
    t.string "description"
    t.integer "insales_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "tours"
end
