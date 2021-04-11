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

ActiveRecord::Schema.define(version: 20210411152610) do

  create_table "cars", force: :cascade do |t|
    t.string   "vin"
    t.string   "vendor"
    t.string   "model"
    t.integer  "year"
    t.integer  "mileage"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "finances", force: :cascade do |t|
    t.integer  "value"
    t.boolean  "dc"
    t.integer  "user_id"
    t.string   "target"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.index ["order_id"], name: "index_finances_on_order_id"
    t.index ["user_id"], name: "index_finances_on_user_id"
  end

  create_table "goods", force: :cascade do |t|
    t.string   "partnumber"
    t.string   "price"
    t.integer  "cost"
    t.integer  "outercost"
    t.date     "expdate"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_goods_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "manager"
    t.string   "name"
    t.string   "email"
    t.bigint   "phone"
    t.text     "message"
    t.string   "status"
    t.text     "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "estimated_date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "secondname"
    t.bigint   "phone"
    t.string   "email"
    t.string   "adress"
    t.boolean  "admin"
    t.string   "role"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [nil, nil], name: "index_users_on_order_id_and_car_id"
  end

end
