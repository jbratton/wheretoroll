# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready( ->

  load_practice_modal = (practice_id) ->
    $.ajax("open_practices/" + practice_id)
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
            <p>There was an error loading the practice information.
              Please give it another try and if there are still problems, let us know at
              <a href="mailto:info@wheretoroll.com">info@wheretoroll.com</a> or on
              <a href="https://www.facebook.com/wheretoroll">Facebook</a>.
            </p>
          </div>
        ')
      )

  $("tr[data-practice-id]").on("click", ->
    load_practice_modal($(this).data("practice-id"))
  )

  # set up day checkboxes to enable corresponding time fields when checked
  days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
  set_change = (day) ->
    $("#open_practice_#{day}").on("change", (e) ->
      start_input = $("##{day}_start")
      end_input = $("##{day}_end")
      if (this.checked)
        start_input.prop("disabled", false)
        end_input.prop("disabled", false)
      else
        start_input.prop("disabled", true)
        end_input.prop("disabled", true)
        start_input.val("")
        end_input.val("")
    )
  (set_change day for day in days)

  # set up open practice form validation
  $("#new_open_practice").bootstrapValidator({
    feedbackIcons: false,
    submitButtons: "[name='commit']",
    fields: {
      "open_practice[submission_contact]": {
        validators: {
          notEmpty: {
            message: "Your email address is required."
          },
          emailAddress: {
            message: "Please enter a valid email address."
          }
        }
      },
      "open_practice[city]": {
        validators: {
          notEmpty: {
            message: "Please tell us the city where you practice."
          }
        }
      },
      "open_practice[country]": {
        validators: {
          notEmpty: {
            message: "The country is required."
          }
        }
      }
    }
  })

  # init time pickers in open practice form
  $("#monday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#monday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#tuesday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#tuesday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#wednesday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#wednesday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#thursday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#thursday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#friday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#friday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#saturday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#saturday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#sunday_start_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
  $("#sunday_end_group").datetimepicker({
    stepping: 15,
    format: "h:mm a"
  })
)

