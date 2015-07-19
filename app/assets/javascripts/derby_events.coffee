# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
###
$(document).ready( ->
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
      "derby_event[start_time]": {
        validators: {
          notEmpty: {
            message: "Start time is required."
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
      "derby_event[state]": {
        validators: {
          notEmpty: {
            message: "The state or province or your country's equivalent is required."
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
###

