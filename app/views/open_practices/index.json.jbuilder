json.array!(@open_practices) do |open_practice|
  json.extract! open_practice, :id, :league_name, :league_website, :city, :state, :postal_code, :country, :venue, :cost, :monday, :monday_start, :monday_end, :tuesday, :tuesday_start, :tuesday_end, :wednesday, :wednesday_start, :wednesday_end, :thursday, :thursday_start, :thursday_end, :friday, :friday_start, :friday_end, :saturday, :saturday_start, :saturday_end, :sunday, :sunday_start, :sunday_end, :venue, :practice_contact, :submission_contact, :approved, :deleted
  json.url open_practice_url(open_practice, format: :json)
end
