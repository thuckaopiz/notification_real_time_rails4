$ ->
  other_socket = new WebSocket "ws://#{window.location.host}/other_chat"

  other_socket.onmessage = (event) ->
    if event.data.length
      $("#other_output").append "#{event.data}"+ "ssss" + "<br>"

  $("#other_chat").on "submit", (event) ->
    event.preventDefault()
    $input = $(this).find("input")
    other_socket.send $input.val()
    $input.val(null)
