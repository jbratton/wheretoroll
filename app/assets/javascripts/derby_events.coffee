# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready( ->
  $("#event-table").tablesorter({
    sortList: [[0,0]]
  })

  $("tr[data-event-id]").on("click", ->
    # ajax json for event id $(this).data('event-id') and populate #event-modal fields
    document.location = $(this).data('href')
  )
)
