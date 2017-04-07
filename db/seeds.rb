# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(
  :email => 'admin@admin.com',
  :password => 'topsecret',
  :password_confirmation => 'topsecret',
  :roles => ['admin'],
)
user1 = User.create!(
  :email => 'user1@user1.com',
  :password => 'topsecret',
  :password_confirmation => 'topsecret',
  :roles => ['trainer'],
)
user2 = User.create!(
  :email => 'user2@user2.com',
  :password => 'topsecret',
  :password_confirmation => 'topsecret',
  :roles => ['user'],
  :trainer => user1,
)
chat1 = ChatRoom.create!(
  :user => user1,
)
UsersChatRoom.create!(
  :user => user1,
  :chat_room => chat1,
)
UsersChatRoom.create!(
  :user => user2,
  :chat_room => chat1,
)
Message.create!(
  :body => 'First',
  :user => user1,
  :chat_room => chat1,
)
Message.create!(
  :body => 'Second',
  :user => user2,
  :chat_room => chat1,
)
