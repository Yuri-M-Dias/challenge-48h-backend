jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

  if messages.length > 0
    messages_to_bottom()

  App.global_chat = App.cable.subscriptions.create {
    channel: "ChatRoomsChannel"
    chat_room_id: messages.data('chat-room-id')
  },
    connected: ->
      console.log(['connected'])

    disconnected: ->
      console.log(['disconnected'])

    received: (data) ->
      console.log(['received', data])
      messages.append data['message']
      messages_to_bottom()

    send_message: (message, chat_room_id) ->
      console.log(['send', this])
      @perform 'send_message', message: message, chat_room_id: chat_room_id

  $('#new_message').submit (e) ->
    $this = $(this)
    textarea = $this.find('#message_body')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
      textarea.val('')
    e.preventDefault()
    return false

  return
