# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready( ->
  
  populate_event_modal = (data) ->
    preregistration = if data.preregistration then "Yes" else "No"
    spectators = if data.spectators then "Yes" else "No"
    if data.website
      title_html = '<a href="' + data.website + '">' + data.name + "</a>"
    else
      title_html = data.name

    $("#event-name").html(title_html)
    $("#event-date").text(" (" + data.display_date + ")")

    $("#event-host").text("Hosted by " + data.host)

    $("#event-datetime").text(data.display_datetime)

    location_html = ""
    location_html += data.venue + "<br/>" if data.venue
    location_html += data.city + ", " + data.state
    location_html += " " + data.postal_code if data.postal_code
    location_html += "<br/>" + data.country_name
    $("#event-location").html(location_html)

    $("#event-rulesets").text(data.rulesets)
    $("#event-genders").text(data.genders)
    $("#event-cost").text(data.cost)

    $("#event-contact").html('<a href="mailto:' + data.event_contact + '">' + data.event_contact + "</a>")

    $("#event-preregistration").text(preregistration)
    $("#event-spectators").text(spectators)

    if data.html_info
      $("#event-info").html("<h5><u>Other Event Information</u></h5><p>" + data.html_info + "</p>")
      
  show_event_modal = (event_id) ->
    $.ajax("derby_events/" + event_id + ".json")
      .done( (data, status, jqXHR) ->
        populate_event_modal(data)
      )


  # init tablesorter in event list
  $("#event-table").tablesorter({
    sortList: [[0,0]]
  })
    
  # set up event click to load data for modal detail list
  $("tr[data-event-id]").on("click", ->
    show_event_modal($(this).data("event-id"))
  )

  # init datetime picker in submission form
  $("#start_date_group").datetimepicker({
    format: "MM/DD/YYYY"
  })
  $("#start_time_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#end_date_group").datetimepicker({
    format: "MM/DD/YYYY"
  })
  $("#end_time_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#start_date_group").on("dp.change", (e) ->
    $("#end_date_group").data("DateTimePicker").minDate(e.date)
  )
)
