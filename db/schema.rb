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

ActiveRecord::Schema.define(version: 20140312230147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photo_images", force: true do |t|
    t.integer  "user_photo_id",             null: false
    t.binary   "image"
    t.integer  "image_size",    default: 0, null: false
    t.integer  "image_width",   default: 0, null: false
    t.integer  "image_height",  default: 0, null: false
    t.binary   "thumb"
    t.integer  "thumb_size",    default: 0, null: false
    t.integer  "thumb_width",   default: 0, null: false
    t.integer  "thumb_height",  default: 0, null: false
    t.binary   "icon"
    t.integer  "icon_size",     default: 0, null: false
    t.integer  "icon_width",    default: 0, null: false
    t.integer  "icon_height",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", force: true do |t|
    t.integer  "user_id",                   null: false
    t.integer  "user_photo_id",             null: false
    t.integer  "value",         default: 0, null: false
    t.integer  "color"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_auths", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "user_id",                             null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_auths", ["email"], name: "index_user_auths_on_email", unique: true, using: :btree
  add_index "user_auths", ["reset_password_token"], name: "index_user_auths_on_reset_password_token", unique: true, using: :btree

  create_table "user_photos", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "file_name",    default: "", null: false
    t.string   "content_type", default: "", null: false
    t.string   "title"
    t.string   "comment"
    t.integer  "total_size",   default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",        limit: 20, default: "",    null: false
    t.string   "last_name",         limit: 20, default: "",    null: false
    t.string   "nickname",          limit: 20, default: "",    null: false
    t.boolean  "use_nickname",                 default: false, null: false
    t.date     "birthday"
    t.integer  "gender",                       default: 0,     null: false
    t.string   "email_sub"
    t.boolean  "mail_notification",            default: false, null: false
    t.boolean  "admin",                        default: false, null: false
    t.integer  "status",                       default: 0,     null: false
    t.binary   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
