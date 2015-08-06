json.array!(@derby_events) do |derby_event|
  json.extract! derby_event, :id, :name, :start_date, :end_date, :venue, :city, :state, :zip_code, :country, :web_site, :contact, :host, :cost, :ruleset, :preregistration, :spectators
  json.url derby_event_url(derby_event, format: :json)
end
