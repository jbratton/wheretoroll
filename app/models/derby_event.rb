class DerbyEvent < ActiveRecord::Base
  DATE_FORMAT = '%m/%d/%Y'
  TIME_FORMAT = '%l:%M %P'

  def country_name
    cname = ISO3166::Country[country]
    cname.translations[I18n.locale.to_s] || cname.name
  end

  def display_date
    if start_date == end_date || end_date.nil?
      start_date.strftime(DATE_FORMAT)
    else
      "#{start_date.strftime(DATE_FORMAT)} - #{end_date.strftime(DATE_FORMAT)}"
    end
  end

  def display_datetime
    display_str = start_date.strftime(DATE_FORMAT)
    if start_time
      display_str << " #{start_time.strftime(TIME_FORMAT)}"
    end
    if end_date != start_date && !end_date.nil?
      display_str << " - #{end_date.strftime(DATE_FORMAT)}"
    end
    if end_time
      if end_date != start_date
        display_str << " #{end_time.strftime(TIME_FORMAT)}"
      else
        display_str << " - #{end_time.strftime(TIME_FORMAT)}"
      end
    end
    display_str
  end

  def location_html
    lhtml = ''
    lhtml << "#{venue}<br>" unless venue.empty?
    lhtml << city
    lhtml << ", #{state}" unless state.empty?
    lhtml << " #{postal_code}" unless postal_code.empty?
    lhtml << "<br>#{country_name}"
  end

  def rulesets
    ['mrda', 'wftda', 'jrda', 'made', 'usars', 'rdcl'].map do |ruleset|
      send(ruleset) ? ruleset.upcase : nil
    end.compact.join(', ')
  end

  def genders
    ['Male', 'Female', 'Co-Ed'].map do |gender|
      send(gender.downcase.gsub(/[^a-z]/, '')) ? gender : nil
    end.compact.join(', ')
  end

  def html_info
    general_info.gsub(/\r?\n/, "<br>") if general_info
  end
end
