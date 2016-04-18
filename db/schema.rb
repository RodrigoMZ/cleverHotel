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

ActiveRecord::Schema.define(version: 20160418154052) do

  create_table "ads", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "text",        null: false
    t.string   "combination", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ads", ["hotel_id"], name: "index_ads_on_hotel_id"

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.string   "area_type"
    t.string   "hotel_type"
    t.string   "latitude"
    t.string   "longitude"
    t.decimal  "price_from"
    t.decimal  "price_high_season"
    t.boolean  "wifi"
    t.boolean  "pool"
    t.integer  "stars"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.string   "logo"
  end

  add_index "images", ["hotel_id"], name: "index_images_on_hotel_id"

  create_table "languages", force: :cascade do |t|
    t.integer "hotel_id"
    t.string  "url",           null: false
    t.string  "language_code", null: false
  end

  add_index "languages", ["hotel_id"], name: "index_languages_on_hotel_id"

  create_table "neighborhoods", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "neighborhoods", ["hotel_id"], name: "index_neighborhoods_on_hotel_id"

  create_table "pois", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pois", ["hotel_id"], name: "index_pois_on_hotel_id"

end
