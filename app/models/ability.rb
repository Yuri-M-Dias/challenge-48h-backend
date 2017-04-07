class Ability
  include CanCan::Ability

  def initialize(user)
    unless user
      cannot :manage, :all
      return
    end
    alias_action :create, :read, :update, :destroy, to: :crud
    can :manage, :all if user.has_role? :admin
    can :index, ChatRoom
    puts "Roles:#{user.roles}"
    if user.has_role? :trainer or user.has_role? :user
      can :manage, ChatRoom, user_id: user.id
      can :read, ChatRoom do |chatRoom|
        user.chat_rooms.include? chatRoom
      end
      can :create, Message
      can :crud, Message, user_id: user.id
      can :read, Message do |message|
        user.chat_rooms.include? message.chat_room
      end
    end
  end

end
