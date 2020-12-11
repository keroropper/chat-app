class RoomsController < ApplicationController

def new
  @room = Room.new #値が空のRoomインスタンスを@roomに代入
end

def create
  @room = Room.new(room_params)  #↓の値を引数として入力
  if @room.save
    redirect_to root_path
  else
    render :new
  end

def index
end



end


private

def room_params
  params.require(:room).permit(:name, user_ids: []) #new.html.erbのroomの中のname:user_idsの中の[ ]を取得する。
end


end
