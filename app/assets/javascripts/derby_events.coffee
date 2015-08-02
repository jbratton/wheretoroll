# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready( ->
  
  # only required name, start_date, city, country
  populate_event_modal = (data) ->
    preregistration = if data.preregistration then "Yes" else "No"
    spectators = if data.spectators then "Yes" else "No"
    if data.website
      title_html = '<a href="' + data.website + '">' + data.name + "</a>"
    else
      title_html = data.name

    if data.host
      title_html += '<br><span class="small">Hosted by ' + data.host + '</span>'

    $("#event-name").html(title_html)

    $("#event-datetime").text(data.display_datetime)

    location_html = ""
    location_html += data.venue + "<br>" if data.venue
    location_html += data.city
    location_html += ", " + data.state if data.state
    location_html += " " + data.postal_code if data.postal_code
    location_html += "<br>" + data.country_name
    $("#event-location").html(location_html)

    $("#event-rulesets").text(if data.rulesets == "" then "none specified" else data.rulesets)
    $("#event-genders").text(if data.genders == "" then "none specified" else data.genders)
    $("#event-cost").text(if data.cost == "" then "not specified" else data.cost)

    if data.event_contact == ""
      $("#event-contact").html("not specified")
    else
      $("#event-contact").html('<a href="mailto:' + data.event_contact + '">' + data.event_contact + "</a>")

    $("#event-preregistration").text(preregistration)
    $("#event-spectators").text(spectators)

    if data.html_info
      $("#event-info").html('<span><strong>Other Information</strong></span><div class="panel panel-default"><div class="panel-body">' + data.html_info + "</div></div>")
    else
      $("#event-info").html("")

    $("#event-share-link").html('Shareable link to this event: <a href="http://www.wheretoroll.com/?shared_event=' + data.id + '">http://www.wheretoroll.com/?shared_event=' + data.id + "</a>")
      
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

  # check URL for shared_event query string parameter
  # if it's there, show the modal for that event
  match_array = window.location.search.match(/shared_event=(\d+)/)
  if match_array
    show_event_modal(match_array[1])
    $("#event-modal").modal('show')
)
