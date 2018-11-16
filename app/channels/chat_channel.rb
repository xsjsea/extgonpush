class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast('messages',
    #   message: render_message(data['message']))
    ActionCable.server.broadcast 'room_channel', message: data['message']
    Message.create! content: data['message'], order_id: data['order_id'], step_order: data['step_order'], user_id: data['user_id'],
    creatorstatus: data['creatorstatus'],marketerstatus: data['marketerstatus'],
    adminstatus: data['adminstatus']
  end

  private

  def render(message)
    # message
    foo = ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: {
        message: message
      }
    )
    logger.info("FOO: #{foo}")
    foo
  end
end
