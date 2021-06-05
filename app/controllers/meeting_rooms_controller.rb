class MeetingRoomsController < ApplicationController
  require 'securerandom'

  def index
    @new_meeting_room        = MeetingRoom.new
    @attending_rooms = current_user.attending_rooms
  end

  def show
    @meeting_room = MeetingRoom.find(params[:id])
    unless current_user.attend?(@meeting_room)
      RoomUser.create!(
        user_id: current_user.id,
        meeting_room_id: @meeting_room.id
      )
    end
    @chats = @meeting_room.chats.order("id")
    @members = @meeting_room.members
    @new_chat = Chat.new
    session[:meeting_room_id] = @meeting_room.id
  end

  def create
    @new_meeting_room            = MeetingRoom.new(meeting_room_params)
    # meeting_room作成者のidをリーダーidとする
    @new_meeting_room.leader_id  = current_user.id
    # ランダムな大小含めた英数字10文字をミーティングidとする
    @new_meeting_room.meeting_id = SecureRandom.alphanumeric(10)
    if params[:name] != ""
      if @new_meeting_room.save
        @new_room_user = RoomUser.new(
                                    user_id: current_user.id,
                                    meeting_room_id: @new_meeting_room.id
                                  )
        if @new_room_user.save
          flash[:success] = "Object successfully created"
          redirect_to @new_meeting_room
        end
      else
        @attending_rooms = current_user.attending_rooms
        flash[:error] = "Something went wrong"
        render 'index'
      end
    end
  end

  def search_room
    @search_room = MeetingRoom.where(meeting_id: params[:meeting_id])
    if @search_room.present?
      # 存在する
      @new_meeting_room = MeetingRoom.new
      @attending_rooms = @search_room
      render :index
    else
      # 存在しない
      redirect_to no_room_path
    end
  end

  def enter_room
    @new_room_user = RoomUser.new(
      user_id: current_user.id,
      meeting_room_id: params[:meeting_room_id]
    )
    @new_room_user.save
    redirect_to meeting_room_path(params[:meeting_room_id])
  end

  def no_room

  end

  private

  def meeting_room_params
    params.require(:meeting_room).permit(:name)
  end
  
end
