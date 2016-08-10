require 'csv'

print '    Purging any old stamp data...'
#StampRaw.destroy_all
Stamp.destroy_all
puts 'done.'


print '    Importing raw stamp data into staging table...'

=begin
#CSV.foreach("db/stamps.gb.csv", headers: true) do |row|
CSV.foreach("raw_data/xena_stamps.csv", headers: true) do |row|
  h = row.to_hash
  StampRaw.create!(
                # issuing entity
                :country_name => h['country_name'],
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
                :stamp_hash => h['stamp_hash'],
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
=end
puts 'done.'


print '    Organizing stamp data by country...'
StampRaw.order('country_name').where("country_name='France'").order('id').each do |raw|
  Stamp.create!(   # issuing entity
                   :country_name => raw.country_name,
                   :sub_country_name => raw.sub_country_name,
                   #--- SET level fields
                   :set_description => raw.set_description,
                   :set_text => raw.set_text,
                   :set_designer => raw.set_designer,
                   :set_start_year => raw.set_start_year,
                   :set_start_month => raw.set_start_month,
                   :set_start_day => raw.set_start_day,
                   :set_end_year => raw.set_end_year,
                   :set_end_month => raw.set_end_month,
                   :set_end_day => raw.set_end_day,
                   :set_perf_info => raw.set_perf_info,
                   :set_type_number => raw.set_type_number,
                   :set_watermark_number => raw.set_watermark_number,
                   #--- STAMP level fields
                   :stamp_hash => raw.stamp_hash,
                   :sg_number => raw.sg_number,
                   :stamp_prefix => raw.stamp_prefix,
                   :stamp_sg_number => raw.stamp_sg_number,
                   :stamp_pre_suffix => raw.stamp_pre_suffix,
                   :stamp_suffix => raw.stamp_suffix,
                   :stamp_description => raw.stamp_description,
                   :variety_description => raw.variety_description,
                   :stamp_issue_price => raw.stamp_issue_price,
                   :stamp_type_number => raw.stamp_type_number,
                   :stamp_unused => raw.stamp_unused,
                   :stamp_used => raw.stamp_used,
                   :variety_flag => raw.variety_flag)
end


puts '    done. Stamp records created!'.colorize(:green).bold

