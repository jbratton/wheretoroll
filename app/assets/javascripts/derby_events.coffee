# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready( ->
  
  # set up event click to load data for modal detail list
  $("tr[data-event-id]").on("click", ->
    document.load_event_modal($(this).data("event-id"))
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
    document.load_event_modal(match_array[1])
    $("#event-modal").modal('show')

  # set up derby event form validation
  $('#new_derby_event').bootstrapValidator({
    feedbackIcons: false,
    submitButtons: "[name='commit']",
    fields: {
      "derby_event[submission_contact]": {
        validators: {
          notEmpty: {
            message: "Your email address is required."
          },
          emailAddress: {
            message: "Please enter a valid email address."
          }
        }
      },
      "derby_event[name]": {
        validators: {
          notEmpty: {
            message: "We need to know the name of the event!"
          }
        }
      },
      "derby_event[start_date]": {
        validators: {
          notEmpty: {
            message: "The date of the event is required."
          }
        }
      },
      "derby_event[city]": {
        validators: {
          notEmpty: {
            message: "Please tell us the city the event will be in."
          }
        }
      },
      "derby_event[country]": {
        validators: {
          notEmpty: {
            message: "The country is required."
          }
        }
      }
    }
  })
)

