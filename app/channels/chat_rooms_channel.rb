# frozen_string_literal: true
class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name(params['chat_room_id'])
  end

  def unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end

  # Rebroadcast
  def receive(data)
    MessageBroadcastJob.perform_later data
  end

  def self.channel_name(chat_room_id)
    "chat_rooms_#{chat_room_id}_channel"
  end
end
