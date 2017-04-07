admin = User.create!(
  email: 'admin@admin.com',
  password: 'topsecret',
  password_confirmation: 'topsecret',
  roles: ['admin'],
)
user1 = User.create!(
  email: 'user1@user1.com',
  password: 'topsecret',
  password_confirmation: 'topsecret',
  roles: ['trainer'],
)
user2 = User.create!(
  email: 'user2@user2.com',
  password: 'topsecret',
  password_confirmation: 'topsecret',
  roles: ['user'],
  trainer: user1,
)
chat1 = ChatRoom.create!(
  user: user1,
  receiver: user2,
)
UsersChatRoom.create!(
  user: user1,
  chat_room: chat1,
)
UsersChatRoom.create!(
  user: user2,
  chat_room: chat1,
)
Message.create!(
  body: 'First',
  user: user1,
  chat_room: chat1,
)
Message.create!(
  body: 'Second',
  user: user2,
  chat_room: chat1,
)
