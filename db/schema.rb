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

ActiveRecord::Schema.define(version: 20160810145123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stamps", force: :cascade do |t|
    t.string   "country_name"
    t.string   "sub_country_name"
    t.string   "set_description"
    t.text     "set_text"
    t.string   "set_designer"
    t.string   "set_start_year"
    t.string   "set_start_month"
    t.string   "set_start_day"
    t.string   "set_end_year"
    t.string   "set_end_month"
    t.string   "set_end_day"
    t.string   "set_perf_info"
    t.string   "set_type_number"
    t.string   "set_watermark_number"
    t.string   "sg_number"
    t.string   "stamp_prefix"
    t.string   "stamp_sg_number"
    t.string   "stamp_pre_suffix"
    t.string   "stamp_suffix"
    t.string   "stamp_description"
    t.string   "variety_description"
    t.string   "stamp_issue_price"
    t.string   "stamp_type_number"
    t.string   "stamp_unused"
    t.string   "stamp_used"
    t.string   "variety_flag"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_url"
    t.string   "computed_description"
    t.string   "local_image_url"
    t.string   "scott_number"
    t.string   "stamp_hash"
    t.string   "issuer"
  end

  create_table "stamps_raw", force: :cascade do |t|
    t.string   "country_name"
    t.string   "sub_country_name"
    t.string   "set_description"
    t.text     "set_text"
    t.string   "set_designer"
    t.string   "set_start_year"
    t.string   "set_start_month"
    t.string   "set_start_day"
    t.string   "set_end_year"
    t.string   "set_end_month"
    t.string   "set_end_day"
    t.string   "set_perf_info"
    t.string   "set_type_number"
    t.string   "set_watermark_number"
    t.string   "sg_number"
    t.string   "stamp_prefix"
    t.string   "stamp_sg_number"
    t.string   "stamp_pre_suffix"
    t.string   "stamp_suffix"
    t.string   "stamp_description"
    t.string   "variety_description"
    t.string   "stamp_issue_price"
    t.string   "stamp_type_number"
    t.string   "stamp_unused"
    t.string   "stamp_used"
    t.string   "variety_flag"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_url"
    t.string   "computed_description"
    t.string   "local_image_url"
    t.string   "scott_number"
    t.string   "stamp_hash"
  end

end
