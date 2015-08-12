$ ->

#  dispatcher = new WebSocketRails("localhost:3000/websocket")
#
#  $('#first_send').on 'click', (e) ->
#    msg_first = $('#first_input').val()
#    $('#first_input').val('')
#    console.log 'Notification first: ', msg_first
#    task =
#      name: msg_first,
#      user: 'Alex'
#
#    dispatcher.trigger 'tasks.create', task
#
#  $('#second_send').on 'click', (e) ->
#    msg_second = $('#second_input').val()
#    $('#second_input').val('')
#    console.log 'Notification second: ', msg_second
#
#    task =
#      name: msg_second,
#      user: 'Chuck Noris'
#
#    dispatcher.trigger 'tasks.create', task
#
#  $('#third_send').on 'click', (e) ->
#    msg_third = $('#third_input').val()
#    $('#third_input').val('')
#    console.log 'Notification second: ', msg_third
#
#    task =
#      name: msg_third,
#      user: 'Van Dam'
#
#    dispatcher.trigger 'tasks.create', task
#
#
#  dispatcher.bind "tasks.create_success", (task) ->
#    console.log "successfully created " + task.name
#    message = "<option>" + task.user + ': ' + task.name + "</option>"
#    $('#first_user').append(message)
#    $('#second_user').append(message)
#    $('#third_user').append(message)

  dispatcher = new WebSocketRails('localhost:3000/websocket')

  channel = dispatcher.subscribe('channel_name')

  channel.bind 'new', (data) ->
    console.log('channel event received: ', data.user, data.body)
#    message = "<option>" + data.user + ': ' + data.body + "</option>"
    message = "<li>" + data.user + ': ' + data.body + "</li>"
    if data.user == 'Chack Norris'
      $('#first_user').append("<li><span style='color: red;'>" + data.user + '</span>: ' + data.body + "</li>")
    else
      $('#first_user').append(message)
    $('#second_user').append(message)
    $('#third_user').append(message)


  $('#first_send').on 'click', (e) ->
    $.ajax
      async: false
      type: 'post'
      url: '/notifications'
      data:
        notification: {
          body: $('#first_input').val(),
          user: $('#first p').text()
        }
    $('#first_input').val('')

  $('#second_send').on 'click', (e) ->
    $.ajax
      async: false
      type: 'post'
      url: '/notifications'
      data:
        notification: {
          body: $('#second_input').val(),
          user: $('#second p').text()
        }
    $('#second_input').val('')

  $('#third_send').on 'click', (e) ->
    $.ajax
      async: false
      type: 'post'
      url: '/notifications'
      data:
        notification: {
          body: $('#third_input').val(),
          user: $('#third p').text()
        }
    $('#third_input').val('')