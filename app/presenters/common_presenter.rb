module CommonPresenter
  DATE_FORMAT = '%m/%d/%Y'
  TIME_FORMAT = '%l:%M %P'

  def country_name
    country_name = ISO3166::Country[country]
    country_name.translations[I18n.locale.to_s] || country_name.name
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
