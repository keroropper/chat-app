class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id]) #roomのidを取得
    @message =  Message.new #からのインスタンス。→これから情報が入力されるから
    @messages = @room.messages.includes(:user)
    #チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義します。
    #全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができます。


  end



  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end


private

def message_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end


  
end
