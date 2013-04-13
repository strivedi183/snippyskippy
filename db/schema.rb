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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130413153116) do

  create_table "bookings", :force => true do |t|
    t.date     "appointment_date"
    t.time     "appointment_time"
    t.integer  "client_id"
    t.integer  "medium_id"
    t.integer  "stylist_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "medium_id"
    t.integer  "client_id"
    t.integer  "rank"
    t.boolean  "is_favorite"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "media", :force => true do |t|
    t.string   "title"
    t.text     "photo"
    t.text     "video"
    t.string   "type"
    t.text     "description"
    t.integer  "stylist_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "media_tags", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "medium_id"
  end

  create_table "polls", :force => true do |t|
    t.integer  "client_id"
    t.integer  "rank_1_medium_id"
    t.integer  "rank_2_medium_id"
    t.integer  "rank_3_medium_id"
    t.integer  "vote_1",           :default => 0
    t.integer  "vote_2",           :default => 0
    t.integer  "vote_3",           :default => 0
    t.boolean  "is_active",        :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "salons", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stylists", :force => true do |t|
    t.integer  "salon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "image"
    t.string   "password_digest"
    t.integer  "userable_id"
    t.string   "userable_type"
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
