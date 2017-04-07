# frozen_string_literal: true
class UsersChatRoom < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room, dependent: :destroy
end
