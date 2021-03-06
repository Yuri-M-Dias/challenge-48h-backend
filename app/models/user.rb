# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :trainer, class_name: 'User', foreign_key: 'trainer_id'
  has_many :clients, class_name: 'User', foreign_key: 'trainer_id'

  has_many :users_chat_rooms
  has_many :chat_rooms, through: :users_chat_rooms
  has_many :messages, dependent: :destroy
  has_many :receiving_chat_rooms, class_name: 'ChatRoom'

  def name
    email.split('@')[0]
  end

  # CanCanCan's ROLES configuration
  ROLES = %i[admin trainer user]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def trainer?
    has_role?('trainer')
  end

  def user?
    has_role?('user')
  end
end
