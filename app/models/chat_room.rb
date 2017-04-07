# frozen_string_literal: true
class ChatRoom < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :messages, dependent: :destroy
  has_many :users_chat_rooms, dependent: :destroy
end
