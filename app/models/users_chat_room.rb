class UsersChatRoom < ApplicationRecord
  belongs_to :user#, :inverse_of => :users_chat_rooms
  belongs_to :chat_room#, :inverse_of => :users_chat_rooms
end
