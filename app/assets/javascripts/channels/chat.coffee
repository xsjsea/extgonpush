App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Extra Step_order value from data['message']
    # Reference http://www.rubular.com/r/XKUdr9a3jh
    result = data['message'].match(/<input type="hidden" [^>]*? value="(.*)"/)
    step_order = result[1]
    # alert step_order

    # Generate '#messages_list_1,#messages_list_2,...'
    $('#messages_list_'+ step_order).append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    step_order = event.target.id.replace(/\D/g,'')
 
    @perform 'speak', message: message, order_id: $('#order_id').val(), step_order: step_order, user_id: $('#user_id').val(),creatorstatus:$('#creatorstatus').val(),
    marketerstatus:$('#marketerstatus').val(),adminstatus:$('#adminstatus').val()


$(document).on 'keypress', '[data-behavior~=room_speaker_1],[data-behavior~=room_speaker_2],[data-behavior~=room_speaker_3],[data-behavior~=room_speaker_4],[data-behavior~=room_speaker_5]', (event) ->
  if event.keyCode is 13
    App.chat.speak event.target.value
    event.target.value = ''
    event.preventDefault()
