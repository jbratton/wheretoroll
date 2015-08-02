json.extract! @derby_event, :id, :start_date, :start_time, :end_date, :end_time, :display_date, :display_datetime, :country, :country_name, :cost, :rulesets, :genders, :preregistration, :spectators, :general_info
json.website @derby_event.website.html_safe
json.host @derby_event.host.html_safe
json.name @derby_event.name.html_safe
json.venue @derby_event.venue.html_safe
json.city @derby_event.city.html_safe
json.state @derby_event.state.html_safe
json.postal_code @derby_event.postal_code.html_safe
json.event_contact @derby_event.event_contact.html_safe
json.html_info auto_link(@derby_event.html_info)
json.fb_html %Q(<a href="https://www.facebook.com/sharer/sharer.php?u=#{root_url}?shared_event=#{@derby_event.id}">#{image_tag "fbshare.png"}</a>)
json.share_html %Q(Shareable link to this event: <a href="#{root_url}?shared_event=#{@derby_event.id}">#{root_url}?shared_event=#{@derby_event.id}</a>)

