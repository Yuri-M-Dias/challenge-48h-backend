# frozen_string_literal: true
class Message < ApplicationRecord
  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  belongs_to :user
  belongs_to :chat_room

  after_create_commit :broadcast_message

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
