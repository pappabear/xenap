class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :country_name
      t.string :sub_country_name
      t.string :set_description
      t.text :set_text
      t.string :set_designer
      t.string :set_start_year
      t.string :set_start_month
      t.string :set_start_day
      t.string :set_end_year
      t.string :set_end_month
      t.string :set_end_day
      t.string :set_perf_info
      t.string :set_type_number
      t.string :set_watermark_number
      t.string :sg_number
      t.string :stamp_prefix
      t.string :stamp_sg_number
      t.string :stamp_pre_suffix
      t.string :stamp_suffix
      t.string :stamp_description
      t.string :variety_description
      t.string :stamp_issue_price
      t.string :stamp_type_number
      t.string :stamp_unused
      t.string :stamp_used
      t.string :variety_flag

      t.timestamps null: false
    end


    create_table :stamps_raw do |t|
      t.string :country_name
      t.string :sub_country_name
      t.string :set_description
      t.text :set_text
      t.string :set_designer
      t.string :set_start_year
      t.string :set_start_month
      t.string :set_start_day
      t.string :set_end_year
      t.string :set_end_month
      t.string :set_end_day
      t.string :set_perf_info
      t.string :set_type_number
      t.string :set_watermark_number
      t.string :sg_number
      t.string :stamp_prefix
      t.string :stamp_sg_number
      t.string :stamp_pre_suffix
      t.string :stamp_suffix
      t.string :stamp_description
      t.string :variety_description
      t.string :stamp_issue_price
      t.string :stamp_type_number
      t.string :stamp_unused
      t.string :stamp_used
      t.string :variety_flag

      t.timestamps null: false
    end


  end
end
