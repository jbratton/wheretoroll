class OpenPractice < ActiveRecord::Base
  TIME_FORMAT = '%l:%M %P'

  #TODO: move all of these into presenter objects, extract commonalities with DerbyEvent
  
  def display_days
    ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'].map do |day|
      if send(day)
        "#{day.capitalize} #{send("#{day}_start").strftime(TIME_FORMAT)} - #{send("#{day}_end").strftime(TIME_FORMAT)}"
      end
    end.compact.join("<br>")
  end

  def country_name
    cname = ISO3166::Country[country]
    cname.translations[I18n.locale.to_s] || cname.name
  end

  def location_html
    lhtml = ''
    lhtml << "#{venue}<br>" unless venue.empty?
    lhtml << city
    lhtml << ", #{state}" unless state.empty?
    lhtml << " #{postal_code}" unless postal_code.empty?
    lhtml << "<br>#{country_name}"
  end
end
