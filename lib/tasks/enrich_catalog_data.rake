desc 'Beginning to enrich the catalog data in the database...'
puts 'Beginning to enrich the catalog data in the database...'

desc 'Step 1: Remove the hardcoded string NULL...'
puts 'Step 1: Remove the hardcoded string NULL...'
task :enrich_catalog_data => :environment do
  Stamp.all.each do |stamp|
    stamp.country_name = stamp.country_name == "NULL" ? nil : stamp.country_name
    stamp.sub_country_name = stamp.sub_country_name == "NULL" ? nil : stamp.sub_country_name
    stamp.set_description = stamp.set_description == "NULL" ? nil : stamp.set_description
    stamp.set_text = stamp.set_text == "NULL" ? nil : stamp.set_text
    stamp.set_designer = stamp.set_designer == "NULL" ? nil : stamp.set_designer
    stamp.set_start_year = stamp.set_start_year == "NULL" ? nil : stamp.set_start_year
    stamp.set_start_month = stamp.set_start_month == "NULL" ? nil : stamp.set_start_month
    stamp.set_start_day = stamp.set_start_day == "NULL" ? nil : stamp.set_start_day
    stamp.set_end_year = stamp.set_end_year == "NULL" ? nil : stamp.set_end_year
    stamp.set_end_month = stamp.set_end_month == "NULL" ? nil : stamp.set_end_month
    stamp.set_end_day = stamp.set_end_day == "NULL" ? nil : stamp.set_end_day
    stamp.set_perf_info = stamp.set_perf_info == "NULL" ? nil : stamp.set_perf_info
    stamp.set_type_number = stamp.set_type_number == "NULL" ? nil : stamp.set_type_number
    stamp.set_watermark_number = stamp.set_watermark_number == "NULL" ? nil : stamp.set_watermark_number
    stamp.sg_number = stamp.sg_number == "NULL" ? nil : stamp.sg_number
    stamp.stamp_prefix = stamp.stamp_prefix == "NULL" ? nil : stamp.stamp_prefix
    stamp.stamp_sg_number = stamp.stamp_sg_number == "NULL" ? nil : stamp.stamp_sg_number
    stamp.stamp_pre_suffix = stamp.stamp_pre_suffix == "NULL" ? nil : stamp.stamp_pre_suffix
    stamp.stamp_suffix = stamp.stamp_suffix == "NULL" ? nil : stamp.stamp_suffix
    stamp.stamp_description = stamp.stamp_description == "NULL" ? nil : stamp.stamp_description
    stamp.variety_description = stamp.variety_description == "NULL" ? nil : stamp.variety_description
    stamp.stamp_issue_price = stamp.stamp_issue_price == "NULL" ? nil : stamp.stamp_issue_price
    stamp.stamp_type_number = stamp.stamp_type_number == "NULL" ? nil : stamp.stamp_type_number
    stamp.stamp_unused = stamp.stamp_unused == "NULL" ? nil : stamp.stamp_unused
    stamp.stamp_used = stamp.stamp_used == "NULL" ? nil : stamp.stamp_used
    stamp.variety_flag = stamp.variety_flag == "NULL" ? nil : stamp.variety_flag

    stamp.save!
  end
end

puts 'Data enrichment job complete.'