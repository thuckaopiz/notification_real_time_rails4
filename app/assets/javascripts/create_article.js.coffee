$ ->
  socket_signout = new WebSocket "ws://#{window.location.host}/create_article"

  socket_signout.onmessage = (event) ->
    if event.data.length
      console.log((JSON.parse(event.data)))
      onlineStatus = "#online-status-" + JSON.parse(event.data)["id"]
      $(onlineStatus).removeClass("online");
      $("#output").append "#{event.data}<br>"

  $("#new_article" ).on 'submit', (event) ->
    event.preventDefault()
    socket_signout.send ""
