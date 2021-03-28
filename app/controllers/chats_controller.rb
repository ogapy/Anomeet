class ChatsController < ApplicationController
  def create
    @new_chat = Chat.new(chat_params)
    @new_chat.user_id = current_user.id
    @new_chat.meeting_room_id = session[:meeting_room_id]
    if @new_chat.save
      redirect_to meeting_room_path(session[:meeting_room_id])
    else
      redirect_to meeting_room_path(session[:meeting_room_id])
    end
  end

  def update
    @chat = Chat.find(params[:id])
    @chat.update(is_disclosed: !@chat.is_disclosed)
    redirect_to meeting_room_path(session[:meeting_room_id])
  end

  private
  def chat_params
    params.require(:chat).permit(:content)
  end
end
