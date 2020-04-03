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

ActiveRecord::Schema.define(version: 2020_04_03_062717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "street_nr"
    t.string "postcode"
    t.string "city"
    t.string "country"
    t.string "phone_nr"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "in_assignment_id"
    t.bigint "out_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["in_assignment_id"], name: "index_assignments_on_in_assignment_id"
    t.index ["out_assignment_id"], name: "index_assignments_on_out_assignment_id"
  end

  create_table "in_assignments", force: :cascade do |t|
    t.string "reference"
    t.bigint "load_in_id"
    t.string "lot_nr"
    t.string "incoming_order_ref"
    t.string "other_ref"
    t.integer "number_of_boxe"
    t.integer "number_of_pallet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "packer"
    t.integer "order_index"
    t.float "net_weight"
    t.bigint "recipient_id"
    t.text "note"
    t.index ["load_in_id"], name: "index_in_assignments_on_load_in_id"
    t.index ["recipient_id"], name: "index_in_assignments_on_recipient_id"
  end

  create_table "load_ins", force: :cascade do |t|
    t.string "reference"
    t.bigint "t1_customer_id"
    t.string "status"
    t.datetime "arrival_date"
    t.string "truck_nr"
    t.string "trailer_nr"
    t.string "type_of_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.float "total_weight"
    t.string "trip_ref"
    t.index ["t1_customer_id"], name: "index_load_ins_on_t1_customer_id"
  end

  create_table "load_outs", force: :cascade do |t|
    t.string "reference"
    t.bigint "t1_customer_id"
    t.string "status"
    t.datetime "departure_date"
    t.string "truck_nr"
    t.string "trailer_nr"
    t.string "type_of_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.float "total_weight"
    t.string "trip_ref"
    t.index ["t1_customer_id"], name: "index_load_outs_on_t1_customer_id"
  end

  create_table "out_assignments", force: :cascade do |t|
    t.string "reference"
    t.bigint "load_out_id"
    t.bigint "recipient_id"
    t.string "lot_nr"
    t.string "other_ref"
    t.integer "number_of_boxe"
    t.integer "number_of_pallet"
    t.float "net_weight"
    t.integer "cost"
    t.integer "div_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_index"
    t.string "incoming_order_ref"
    t.text "note"
    t.string "packer"
    t.index ["load_out_id"], name: "index_out_assignments_on_load_out_id"
    t.index ["recipient_id"], name: "index_out_assignments_on_recipient_id"
  end

  create_table "packers", force: :cascade do |t|
    t.string "packer_nr"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t1_customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "t1_customer_id"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["t1_customer_id"], name: "index_users_on_t1_customer_id"
  end

  add_foreign_key "assignments", "in_assignments"
  add_foreign_key "assignments", "out_assignments"
  add_foreign_key "in_assignments", "load_ins"
  add_foreign_key "in_assignments", "recipients"
  add_foreign_key "load_ins", "t1_customers"
  add_foreign_key "load_outs", "t1_customers"
  add_foreign_key "out_assignments", "load_outs"
  add_foreign_key "out_assignments", "recipients"
  add_foreign_key "users", "t1_customers"
end
