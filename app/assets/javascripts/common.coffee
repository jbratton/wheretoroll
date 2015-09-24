$(document).ready( ->

  document.load_modal = (path, id) ->
    $.ajax(path + id)
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
            <p>There was an error loading the information.
              Please give it another try and if there are still problems, let us know at
              <a href="mailto:info@wheretoroll.com">info@wheretoroll.com</a> or on
              <a href="https://www.facebook.com/wheretoroll">Facebook</a>.
            </p>
          </div>
        ')
      )

  document.load_practice_modal = (practice_id) ->
    document.load_modal("open_practices/", practice_id)

  document.load_event_modal = (event_id) ->
    document.load_modal("derby_events/", event_id)

  document.reset_modal = ->
    $("#event-modal-content").html('<div class="modal-body"><h3>Loading...</h3></div>')

  # clear event list modal once it's hidden
  $("#event-modal").on('hidden.bs.modal', ->
    document.reset_modal()
  )

  # init tablesorter in event/practice list
  $("#event-table").tablesorter({
    sortList: [[0,0]]
  })
)

