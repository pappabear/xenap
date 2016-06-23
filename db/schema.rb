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

ActiveRecord::Schema.define(version: 20160621103244) do

  create_table "stamps", force: :cascade do |t|
    t.string   "country_name",         limit: 255
    t.string   "sub_country_name",     limit: 255
    t.string   "set_description",      limit: 255
    t.text     "set_text",             limit: 65535
    t.string   "set_designer",         limit: 255
    t.string   "set_start_year",       limit: 255
    t.string   "set_start_month",      limit: 255
    t.string   "set_start_day",        limit: 255
    t.string   "set_end_year",         limit: 255
    t.string   "set_end_month",        limit: 255
    t.string   "set_end_day",          limit: 255
    t.string   "set_perf_info",        limit: 255
    t.string   "set_type_number",      limit: 255
    t.string   "set_watermark_number", limit: 255
    t.string   "sg_number",            limit: 255
    t.string   "stamp_prefix",         limit: 255
    t.string   "stamp_sg_number",      limit: 255
    t.string   "stamp_pre_suffix",     limit: 255
    t.string   "stamp_suffix",         limit: 255
    t.string   "stamp_description",    limit: 255
    t.string   "variety_description",  limit: 255
    t.string   "stamp_issue_price",    limit: 255
    t.string   "stamp_type_number",    limit: 255
    t.string   "stamp_unused",         limit: 255
    t.string   "stamp_used",           limit: 255
    t.string   "variety_flag",         limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_url",            limit: 255
  end

end
