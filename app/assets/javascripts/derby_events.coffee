# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready( ->
  
  load_event_modal = (event_id) ->
    $.ajax("derby_events/" + event_id)
      .done( (data, status, jqXHR) ->
        $("#event-modal-content").html(data)
      )
      .fail( (data, status, jqXHR) ->
        $("#event-modal-content").html('
          <div class="modal-header">
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title">Oops!</h3>
          </div>
          <div class="modal-body">
            <p>There was an error loading the event information.
              Please give it another try and if there are still problems, let us know at 
              <a href="mailto:info@wheretoroll.com">info@wheretoroll.com</a> or on 
              <a href="https://www.facebook.com/wheretoroll">Facebook</a>.
            </p>
          </div>
        ')
      )

  reset_event_modal = ->
    $("#event-modal-content").html('<div class="modal-body"><h3>Loading...</h3></div>')

  # clear event list modal once it's hidden
  $("#event-modal").on('hidden.bs.modal', ->
    reset_event_modal()
  )

  # set up event click to load data for modal detail list
  $("tr[data-event-id]").on("click", ->
    load_event_modal($(this).data("event-id"))
  )

  # init tablesorter in event list
  $("#event-table").tablesorter({
    sortList: [[0,0]]
  })
    
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
    load_event_modal(match_array[1])
    $("#event-modal").modal('show')
)
