class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'chat_channel', message: render_message(message)
  end

  private
    def render_message(message)
       user=User.find_by_id(message.user_id)
      ApplicationController.renderer.render(
        partial: 'messages/message',
        locals: {
          message: message, 
          user:user
        },
      )
    end
end
