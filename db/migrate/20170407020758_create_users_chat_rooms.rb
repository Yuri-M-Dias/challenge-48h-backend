class CreateUsersChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :users_chat_rooms do |t|
      t.references :user, foreign_key: true, null: false
      t.references :chat_room, foreign_key: true, null: false

      t.timestamps
    end
  end
end
