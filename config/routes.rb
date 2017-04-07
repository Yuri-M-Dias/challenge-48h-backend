# frozen_string_literal: true
Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :chat_rooms, only: [:new, :create, :show, :index, :destroy]

  mount ActionCable.server => '/cable'
end
