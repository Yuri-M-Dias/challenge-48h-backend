class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new
    can :manage, :all
    # if user.has_role? :admin
    #   can :manage, :all
    # elsif user.has_role? :trainer or user.has_role? :user
    #   can :manage, ChatRoom, user_id: user.id
    #   can :create, Message
    #   # Read all messages that they have made?
    #   can :read, Message, user_id: user.id
    # else
    #   cannot :all, :all
    # end
  end
end
