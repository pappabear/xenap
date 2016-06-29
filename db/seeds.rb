require 'csv'

puts '    Purging any old stamp data...'
Stamp.destroy_all

puts '    Importing France stamp data into MySQL...'

CSV.foreach("db/stamps.france.csv", headers: true) do |row|
  h = row.to_hash
  Stamp.create!(:country_name => h['country_name'],
                :sub_country_name => h['sub_country_name'],
                :set_description => h['set_description'],
                :set_text => h['set_text'],
                :set_designer => h['set_designer'],
                :set_start_year => h['set_start_year'],
                :set_start_month => h['set_start_month'],
                :set_start_day => h['set_start_day'],
                :set_end_year => h['set_end_year'],
                :set_end_month => h['set_end_month'],
                :set_end_day => h['set_end_day'],
                :set_perf_info => h['set_perf_info'],
                :set_type_number => h['set_type_number'],
                :set_watermark_number => h['set_watermark_number'],
                :sg_number => h['sg_number'],
                :stamp_prefix => h['stamp_prefix'],
                :stamp_sg_number => h['stamp_sg_number'],
                :stamp_pre_suffix => h['stamp_pre_suffix'],
                :stamp_suffix => h['stamp_suffix'],
                :stamp_description => h['stamp_description'],
                :variety_description => h['variety_description'],
                :stamp_issue_price => h['stamp_issue_price'],
                :stamp_type_number => h['stamp_type_number'],
                :stamp_unused => h['stamp_unused'],
                :stamp_used => h['stamp_used'],
                :variety_flag => h['variety_flag'])
end


puts '    Importing GB stamp data into MySQL...'

CSV.foreach("db/stamps.gb.csv", headers: true) do |row|
  h = row.to_hash
  Stamp.create!(:country_name => h['country_name'],
                :sub_country_name => h['sub_country_name'],
                #--- SET level fields
                :set_description => h['set_description'],
                :set_text => h['set_text'],
                :set_designer => h['set_designer'],
                :set_start_year => h['set_start_year'],
                :set_start_month => h['set_start_month'],
                :set_start_day => h['set_start_day'],
                :set_end_year => h['set_end_year'],
                :set_end_month => h['set_end_month'],
                :set_end_day => h['set_end_day'],
                :set_perf_info => h['set_perf_info'],
                :set_type_number => h['set_type_number'],
                :set_watermark_number => h['set_watermark_number'],
                #--- STAMP level fields
                :sg_number => h['sg_number'],
                :stamp_prefix => h['stamp_prefix'],
                :stamp_sg_number => h['stamp_sg_number'],
                :stamp_pre_suffix => h['stamp_pre_suffix'],
                :stamp_suffix => h['stamp_suffix'],
                :stamp_description => h['stamp_description'],
                :variety_description => h['variety_description'],
                :stamp_issue_price => h['stamp_issue_price'],
                :stamp_type_number => h['stamp_type_number'],
                :stamp_unused => h['stamp_unused'],
                :stamp_used => h['stamp_used'],
                :variety_flag => h['variety_flag'])
end



puts '    Stamp records created!'.colorize(:green).bold

