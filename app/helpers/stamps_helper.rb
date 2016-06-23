module StampsHelper


  def find_stamps_in_set_with(stamp)
    sql = "select * from stamps where "

    if stamp.country_name.nil?
      sql += "country_name is null and "
    else
      sql += "country_name = '" + stamp.country_name + "' and "
    end

    if stamp.sub_country_name.nil?
      sql += "sub_country_name is null and "
    else
      sql += "sub_country_name = '" + stamp.country_name + "' and "
    end

    if stamp.set_description.nil?
      sql += "set_description is null and "
    else
      sql += "set_description = '" + stamp.set_description + "' and "
    end

    if stamp.set_text.nil?
      sql += "set_text is null and "
    else
      sql += "set_text = '" + stamp.set_text + "' and "
    end

    if stamp.set_designer.nil?
      sql += "set_designer is null and "
    else
      sql += "set_designer = '" + stamp.set_designer + "' and "
    end

    if stamp.set_start_year.nil?
      sql += "set_start_year is null and "
    else
      sql += "set_start_year = '" + stamp.set_start_year + "' and "
    end

    if stamp.set_start_month.nil?
      sql += "set_start_month is null and "
    else
      sql += "set_start_month = '" + stamp.set_start_month + "' and "
    end

    if stamp.set_start_day.nil?
      sql += "set_start_day is null and "
    else
      sql += "set_start_day = '" + stamp.set_start_day + "' and "
    end

    if stamp.set_end_year.nil?
      sql += "set_end_year is null and "
    else
      sql += "set_end_year = '" + stamp.set_end_year + "' and "
    end

    if stamp.set_end_month.nil?
      sql += "set_end_month is null and "
    else
      sql += "set_end_month = '" + stamp.set_end_month + "' and "
    end

    if stamp.set_end_day.nil?
      sql += "set_end_day is null and "
    else
      sql += "set_end_day = '" + stamp.set_end_day + "' and "
    end

    if stamp.set_perf_info.nil?
      sql += "set_perf_info is null and "
    else
      sql += "set_perf_info = '" + stamp.set_perf_info + "' and "
    end

    if stamp.set_type_number.nil?
      sql += "set_type_number is null and "
    else
      sql += "set_type_number = '" + stamp.set_type_number + "' and "
    end

    if stamp.set_watermark_number.nil?
      sql += "set_watermark_number is null  "
    else
      sql += "set_watermark_number = '" + stamp.set_watermark_number + "'  "
    end

    set = Stamp.find_by_sql(sql)


    return set
  end


end
