class MeetingRoomsController < ApplicationController
  require 'securerandom'

  def index
    @new_meeting_room        = MeetingRoom.new
    @attending_meeting_rooms = current_user.room_users
                              .map{ |room_user|
                                room_user.meeting_room
                              }
  end

  def show
  end

  def create
    @new_meeting_room            = MeetingRoom.new(meeting_room_params)
    # meeting_room作成者のidをリーダーidとする
    @new_meeting_room.leader_id  = current_user.id
    # ランダムな大小含めた英数字10文字をミーティングidとする
    @new_meeting_room.meeting_id = SecureRandom.alphanumeric(10)

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
      @attending_meeting_rooms = current_user.meeting_users.map{ |meeting_user|
        meeting_user.meeting_room
      }
      flash[:error] = "Something went wrong"
      render 'index'
    end
  end
  
  private

  def meeting_room_params
    params.require(:meeting_room).permit(:name)
  end
  
end
