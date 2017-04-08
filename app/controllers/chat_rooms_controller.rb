# frozen_string_literal: true
class ChatRoomsController < ApplicationController
  load_and_authorize_resource

  def index
    @chat_rooms = current_user.chat_rooms
  end

  def new
    if current_user.trainer?
      @users = current_user.clients
    else
      @users = User.all
    end
    @chat_room = ChatRoom.new
  end

  def create
    receiver_email = params[:receiver][:email]
    receiver = User.find_by email: receiver_email
    if receiver.nil?
      flash[:error] = 'Receiver needs to exist!'
      redirect_to chat_rooms_path
    end
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    @chat_room.user = current_user
    @chat_room.title << receiver.name
    @chat_room.receiver = receiver
    if @chat_room.save
      add_user_to_chat_room current_user, @chat_room
      add_user_to_chat_room receiver, @chat_room
      Message.create!(
        body: params[:message],
        user: current_user,
        chat_room: @chat_room
      )
      flash[:notice] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def destroy
    @chat_room = ChatRoom.find_by(id: params[:id])
    @chat_room.destroy
    redirect_to chat_rooms_path
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end

  def add_user_to_chat_room(user, chat_room)
    UsersChatRoom.create!(user: user, chat_room: chat_room)
  end
end
