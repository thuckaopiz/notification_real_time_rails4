$ ->
  socket_signout = new WebSocket "ws://#{window.location.host}/sign_out"

  socket_signout.onmessage = (event) ->
    if event.data.length
      console.log((JSON.parse(event.data)))
      onlineStatus = "#online-status-" + JSON.parse(event.data)["id"]
      $(onlineStatus).removeClass("online");
      $("#output").append "#{event.data}<br>"

  $("body" ).on 'click', '#sign_out_link', (event) ->
    event.preventDefault()
    socket_signout.send ""
  
