# frozen_string_literal: true
class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    channel_name = ChatRoomsChannel.channel_name(message.chat_room.id)
    msg = render_message(message)
    ActionCable.server.broadcast channel_name, message: msg
  end

  private

  def render_message(message)
    # Necessary as this is in the background
    ApplicationController.renderer.render(
      partial: 'messages/message', locals: { message: message }
    )
  end

end
