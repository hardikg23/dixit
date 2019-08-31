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

ActiveRecord::Schema.define(version: 2019_08_31_054451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.text "address"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "entity_id", null: false
    t.integer "paymentable_id"
    t.string "paymentable_type"
    t.string "description"
    t.float "amount", null: false
    t.string "from_person"
    t.string "to_person"
    t.integer "payment_type", null: false
    t.datetime "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 1
    t.integer "amount_type"
    t.float "conversion_rate"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "entity_id"
    t.integer "sale_type", null: false
    t.string "description"
    t.float "quantity"
    t.float "amount", null: false
    t.integer "amount_type", null: false
    t.float "conversion_rate"
    t.float "total_paid", default: 0.0
    t.integer "payment_type", null: false
    t.datetime "payment_date"
    t.datetime "purchase_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 1
    t.float "per_carat_rate"
    t.string "invoice_number"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "entity_id", null: false
    t.integer "sale_type", null: false
    t.string "description"
    t.string "broker_name"
    t.float "quantity", null: false
    t.float "return_quantity", default: 0.0
    t.float "amount", null: false
    t.integer "amount_type", null: false
    t.float "conversion_rate"
    t.float "total_received", default: 0.0
    t.integer "payment_type", null: false
    t.datetime "payment_date"
    t.integer "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 1
    t.string "invoice_number"
  end

end
