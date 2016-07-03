desc 'Enrich the catalog data'
task :enrich_catalog_data => :environment do

  # ---------------------------------------------------------------------------------------------------------
  print '    Removing the hardcoded string NULL...'
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
  puts 'Done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Determining the image urls for the FRANCE catalog stamps...'
  s3=""
  sl=""
  n=0
  i=0
  previous_stamp = Stamp.new
  url_determined = false

  Stamp.where('country_name=?', 'France').each do |stamp|

    # if all fields are null its all fubar
    if stamp.stamp_type_number.nil? && stamp.set_description.nil? && s3 == ""
      stamp.image_url = "ERROR in calculating image"
      stamp.local_image_url = "ERROR in calculating image"
      url_determined = true
    end

    # start by assuming this stamp has the same image as the previous one
    # most stamps do NOT start a new set
    stamp.image_url = s3
    stamp.local_image_url = sl

    # now look for exceptions

    # if the stamp-type-number field is populated take that as the TIF file name
    if !url_determined && !stamp.stamp_type_number.nil?
      stamp.image_url = "https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/" + stamp.country_name + "/Resized/" + stamp.stamp_type_number + ".TIF"
      stamp.local_image_url = '/images/France/' + stamp.stamp_type_number + '.jpg'
      s3 = stamp.image_url
      sl = stamp.local_image_url
      i += 1
      url_determined = true
    end

    # assume this stamp has the same image as the previous stamp, unless their is a change in the data. this change
    # indicates a new set or a subset.
    if !url_determined && (stamp.country_name == previous_stamp.country_name &&
        stamp.sub_country_name == previous_stamp.sub_country_name &&
        stamp.sub_country_name == previous_stamp.sub_country_name &&
        stamp.set_description == previous_stamp.set_description &&
        stamp.set_text == previous_stamp.set_text &&
        stamp.set_designer == previous_stamp.set_designer &&
        stamp.set_start_year == previous_stamp.set_start_year &&
        stamp.set_start_month == previous_stamp.set_start_month &&
        stamp.set_start_day == previous_stamp.set_start_day &&
        stamp.set_end_year == previous_stamp.set_end_year &&
        stamp.set_end_month == previous_stamp.set_end_month &&
        stamp.set_end_day == previous_stamp.set_end_day &&
        stamp.set_perf_info == previous_stamp.set_perf_info &&
        stamp.set_type_number == previous_stamp.set_type_number &&
        stamp.set_watermark_number == previous_stamp.set_watermark_number)
      stamp.image_url = previous_stamp.image_url
      stamp.local_image_url = previous_stamp.local_image_url
      i += 1
      url_determined = true
    end

    # look in the set description for the TIFF file name
    if !url_determined && !stamp.set_description.nil? && stamp.set_description[0, 2] == "T "
      # looks like 'T 1. Yellow gum.', where the 1 is the TIFF file name
      stamp.image_url = "https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/" + stamp.country_name + "/Resized/" + stamp.set_description[2, 1] + ".TIF"
      stamp.local_image_url = "/images/France/" + stamp.set_description[2, 1] + ".jpg"
      s3 = stamp.image_url
      sl = stamp.local_image_url
      i += 1
      url_determined = true
    end
    # puts 'image_url=' + stamp.image_url
    stamp.save!
    previous_stamp = stamp
    n += 1
    url_determined = false
  end
  puts 'Done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Determining the image urls for the GREAT BRITAIN catalog stamps...'
  s3=""
  sl=""
  n=0
  i=0
  previous_stamp = Stamp.new
  url_determined = false

  Stamp.where('country_name=?', 'GREAT BRITAIN').each do |stamp|
    stamp.image_url = "tbd"
    stamp.local_image_url = "tbd"
    stamp.save!
  end
  puts 'Done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Replacing the string [gap] with a blank...'
  Stamp.all.each do |stamp|
    stamp.set_text = stamp.set_text.gsub('[gap]', ' ') unless stamp.set_text.nil?
    stamp.save!
  end
  puts 'Done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Filling out issue dates (since the input is chronological, not deterministic)...'
  previous_stamp = Stamp.first
  Stamp.all.each do |stamp|
    stamp.set_start_year = previous_stamp.set_start_year if stamp.set_start_year.nil?
    stamp.set_start_month = previous_stamp.set_start_month if stamp.set_start_month.nil?
    stamp.set_start_day = previous_stamp.set_start_day if stamp.set_start_day.nil?
    stamp.set_end_year = previous_stamp.set_end_year if stamp.set_end_year.nil?
    stamp.set_end_month = previous_stamp.set_end_month if stamp.set_end_month.nil?
    stamp.set_end_day = previous_stamp.set_end_day if stamp.set_end_day.nil?
    stamp.save!
    previous_stamp = stamp
  end
  puts 'Done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Computing the description for each stamp...'
  Stamp.all.each do |stamp|
    stamp.computed_description = ''
    stamp.computed_description += stamp.set_start_year + ' ' unless stamp.set_start_year.nil?
    stamp.computed_description += stamp.stamp_issue_price + ' ' unless stamp.stamp_issue_price.nil?
    stamp.computed_description += stamp.stamp_description + ' ' unless stamp.stamp_description.nil?
    stamp.computed_description += stamp.variety_description + ' ' unless stamp.variety_description.nil?
    stamp.computed_description += stamp.variety_flag unless stamp.variety_flag.nil?
    stamp.save!
  end
  puts 'Done.'
  puts '    Ok, catalog data enrichment job complete.'.colorize(:green).bold

end
