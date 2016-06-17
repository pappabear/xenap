module StampsHelper


  def find_stamps_in_set_with(stamp)
    set = Stamp.where('country_name = ?', stamp.country_name)
              .where('sub_country_name = ?', stamp.sub_country_name)
              .where('set_description = ?', stamp.set_description)
              .where('set_text = ?', stamp.set_text)
              .where('set_designer = ?', stamp.set_designer)
              .where('set_start_year = ?', stamp.set_start_year)
              .where('set_start_month = ?', stamp.set_start_month)
              .where('set_start_day = ?', stamp.set_start_day)
              .where('set_end_year = ?', stamp.set_end_year)
              .where('set_end_month = ?', stamp.set_end_month)
              .where('set_end_day = ?', stamp.set_end_day)
              .where('set_perf_info = ?', stamp.set_perf_info)
              .where('set_type_number = ?', stamp.set_type_number)
              .where('set_watermark_number = ?', stamp.set_watermark_number)
    return set
  end


end
