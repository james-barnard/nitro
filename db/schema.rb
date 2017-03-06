# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170302153832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breweries", force: :cascade do |t|
    t.integer  "region_id"
    t.string   "name"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "breweries", ["person_id"], name: "index_breweries_on_person_id", using: :btree
  add_index "breweries", ["region_id"], name: "index_breweries_on_region_id", using: :btree

  create_table "consumer_purchases", force: :cascade do |t|
    t.integer  "consumer_id"
    t.integer  "pos_vehicle_id"
    t.integer  "product_load_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "consumer_purchases", ["consumer_id"], name: "index_consumer_purchases_on_consumer_id", using: :btree
  add_index "consumer_purchases", ["pos_vehicle_id"], name: "index_consumer_purchases_on_pos_vehicle_id", using: :btree
  add_index "consumer_purchases", ["product_load_id"], name: "index_consumer_purchases_on_product_load_id", using: :btree

  create_table "consumers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "duds", force: :cascade do |t|
    t.integer "run_id"
    t.integer "product_load_id"
    t.text    "status"
  end

  create_table "fb_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sender_id"
    t.decimal  "lat"
    t.decimal  "long"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "pos_machine_id"
    t.boolean  "pos_confirmed"
    t.string   "customer_id"
    t.boolean  "loc_skipped"
    t.string   "last4"
  end

  create_table "fulls", force: :cascade do |t|
    t.integer "run_id"
    t.integer "local_product_id"
    t.text    "status"
  end

  create_table "kegs", force: :cascade do |t|
    t.string   "kid"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "kegs", ["kid"], name: "index_kegs_on_kid", unique: true, using: :btree

  create_table "local_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "brewery_id"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "local_products", ["brewery_id"], name: "index_local_products_on_brewery_id", using: :btree
  add_index "local_products", ["product_id"], name: "index_local_products_on_product_id", using: :btree
  add_index "local_products", ["region_id"], name: "index_local_products_on_region_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "lat"
    t.float    "long"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "cell_phone"
    t.string   "office_phone"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "organizations", ["location_id"], name: "index_organizations_on_location_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.string   "cell_phone"
    t.string   "office_phone"
    t.integer  "location_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "owners", ["location_id"], name: "index_owners_on_location_id", using: :btree
  add_index "owners", ["organization_id"], name: "index_owners_on_organization_id", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string   "meaning"
    t.string   "part_type"
    t.string   "selection"
    t.string   "mid"
    t.integer  "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fb_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "cell_phone"
    t.string   "office_phone"
    t.integer  "location_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "people", ["location_id"], name: "index_people_on_location_id", using: :btree
  add_index "people", ["organization_id"], name: "index_people_on_organization_id", using: :btree

  create_table "pos_vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "access_code"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_loads", force: :cascade do |t|
    t.integer  "local_product_id"
    t.integer  "vending_machine_id"
    t.integer  "total_pours"
    t.datetime "date_loaded"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "removed_at"
    t.integer  "valve"
    t.integer  "enabled"
    t.integer  "poured"
  end

  add_index "product_loads", ["local_product_id"], name: "index_product_loads_on_local_product_id", using: :btree
  add_index "product_loads", ["vending_machine_id"], name: "index_product_loads_on_vending_machine_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.string   "thumbnail"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "product_load_id"
    t.integer  "fb_user_id"
    t.string   "pos_type"
    t.integer  "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "purchases", ["fb_user_id"], name: "index_purchases_on_fb_user_id", using: :btree
  add_index "purchases", ["product_load_id"], name: "index_purchases_on_product_load_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "runs", force: :cascade do |t|
    t.integer "route_id"
    t.text    "status"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vending_machines", force: :cascade do |t|
    t.string   "model"
    t.string   "firmware_version"
    t.integer  "location_id"
    t.integer  "route_id"
    t.string   "owner"
    t.datetime "last_serviced"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "device_id"
    t.boolean  "mode"
  end

  add_index "vending_machines", ["location_id"], name: "index_vending_machines_on_location_id", using: :btree
  add_index "vending_machines", ["route_id"], name: "index_vending_machines_on_route_id", using: :btree

  add_foreign_key "breweries", "people"
  add_foreign_key "breweries", "regions"
  add_foreign_key "consumer_purchases", "consumers"
  add_foreign_key "consumer_purchases", "pos_vehicles"
  add_foreign_key "consumer_purchases", "product_loads"
  add_foreign_key "local_products", "breweries"
  add_foreign_key "local_products", "products"
  add_foreign_key "local_products", "regions"
  add_foreign_key "organizations", "locations"
  add_foreign_key "owners", "locations"
  add_foreign_key "owners", "organizations"
  add_foreign_key "people", "locations"
  add_foreign_key "people", "organizations"
  add_foreign_key "product_loads", "local_products"
  add_foreign_key "product_loads", "vending_machines"
  add_foreign_key "purchases", "fb_users"
  add_foreign_key "purchases", "product_loads"
  add_foreign_key "vending_machines", "locations"
  add_foreign_key "vending_machines", "routes"
end
