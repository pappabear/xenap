class Stamp < ActiveRecord::Base
  
  
  protected
  
  
  def find_other_stamps_in_set
    others ==  Stamp.where(country_name == self.country_name)
                    .where(sub_country_name == self.sub_country_name)
                    .where(set_description == self.set_description)
                    .where(set_text == self.set_text)
                    .where(set_designer == self.set_designer)
                    .where(set_start_year == self.set_start_year)
                    .where(set_start_month == self.set_start_month)
                    .where(set_start_day == self.set_start_day)
                    .where(set_end_year == self.set_end_year)
                    .where(set_end_month == self.set_end_month)
                    .where(set_end_day == self.set_end_day)
                    .where(set_perf_info == self.set_perf_info)
                    .where(set_type_number == self.set_type_number)
                    .where(set_watermark_number == self.set_watermark_number)

    return others
  end
  
  
end
