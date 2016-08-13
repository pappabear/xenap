desc 'Enrich the catalog data'
task :enrich_catalog_data => :environment do


  # ---------------------------------------------------------------------------------------------------------
  print '    Computing the issuer for each stamp...'
  Stamp.all.each do |stamp|
    begin
      if stamp.country_name.nil? && stamp.sub_country_name
        stamp.issuer = stamp.sub_country_name
        stamp.save!
      elsif !stamp.country_name.nil? && stamp.sub_country_name.nil?
        next
      elsif stamp.country_name && stamp.sub_country_name.nil?
        stamp.issuer = stamp.country_name
        stamp.save!
      else
        stamp.issuer = stamp.country_name + " > " + stamp.sub_country_name
        stamp.save!
      end
    rescue
    end
  end
  puts 'done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Determining the image to be used...'
  previous_stamp = Stamp.new

  Stamp.order('issuer').order('id').each do |stamp|

    begin
      if stamp.stamp_type_number == "-"
        node=""
        if !stamp.sub_country_name.nil?
          node = stamp.sub_country_name
        else
          node = stamp.country_name
        end
        #stamp.image_url = "/images/NoImageAvailable.jpg"
        stamp.local_image_url = "/images/NoImageAvailable.jpg"
        stamp.save!
        previous_stamp = stamp

      elsif stamp.stamp_type_number
        # if the stamp_type_number field is present, that is the winner
        node=""
        if !stamp.sub_country_name.nil?
          node = stamp.sub_country_name
        else
          node = stamp.country_name
        end
        #stamp.image_url = "https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/" + node + "/Resized/" + stamp.stamp_type_number + ".tif"
        stamp.local_image_url = "/images/" + node + "/" + stamp.stamp_type_number + '.jpg'
        stamp.save!
        previous_stamp = stamp

      elsif stamp.set_description
      # if stamp_type_number is not present,
      # parse the set_description for the "T " code
        word_array = stamp.set_description.split(" ")
        word_array.each_with_index do |word, i|
          if word == "T" || word == "Type"
            node=""
            if !stamp.sub_country_name.nil?
              node = stamp.sub_country_name
            else
              node = stamp.country_name
            end
            #stamp.image_url = "https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/" + node + "/Resized/" + stamp.stamp_type_number + ".tif"
            stamp.local_image_url = "/images/" + node + "/" + word_array[i+1] + '.jpg'
            stamp.save!
            previous_stamp = stamp
          end
        end
      end
    rescue
    end

    if stamp.local_image_url.nil? && previous_stamp.local_image_url
        #stamp.image_url = "fadsfasdfa"
        stamp.local_image_url = previous_stamp.local_image_url
        stamp.save!
    end
  end
  puts 'done.'



  # ---------------------------------------------------------------------------------------------------------
  print '    Fixing any double periods in image filenames...'
  Stamp.all.each do |stamp|
    stamp.image_url = stamp.image_url.gsub('..', '.') unless stamp.image_url.nil?
    stamp.local_image_url = stamp.local_image_url.gsub('..', '.') unless stamp.local_image_url.nil?
    stamp.save!
  end
  puts 'done.'



  # ---------------------------------------------------------------------------------------------------------
  print '    Replacing the string [gap] with a blank...'
  Stamp.all.each do |stamp|
    stamp.set_text = stamp.set_text.gsub('[gap]', ' ') unless stamp.set_text.nil?
    stamp.save!
  end
  puts 'done.'


  # ---------------------------------------------------------------------------------------------------------
  print '    Filling out issue dates (since the input is chronological, not deterministic)...'
  previous_stamp = Stamp.first
  Stamp.order('issuer').order('id').each do |stamp|
    stamp.set_start_year = previous_stamp.set_start_year if stamp.set_start_year.nil?
    stamp.set_start_month = previous_stamp.set_start_month if stamp.set_start_month.nil?
    stamp.set_start_day = previous_stamp.set_start_day if stamp.set_start_day.nil?
    stamp.set_end_year = previous_stamp.set_end_year if stamp.set_end_year.nil?
    stamp.set_end_month = previous_stamp.set_end_month if stamp.set_end_month.nil?
    stamp.set_end_day = previous_stamp.set_end_day if stamp.set_end_day.nil?
    stamp.save!
    previous_stamp = stamp
  end
  puts 'done.'


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
  puts 'done.'
  puts '    Ok, catalog data enrichment job complete.'.colorize(:green).bold

end
