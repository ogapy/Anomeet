class MeetingRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "meeting_rooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'meeting_rooms_channel', chat_content: data['chat_content']
    chat = Chat.create!(
      content: data["chat_content"],
      meeting_room_id: data["meeting_room_id"],
      user_id: current_user.id
    )
    # Chat.create!(
    #   content: data[:chat_content],
    #   meeting_room_id: data[:meeting_room_id],
    #   user_id: current_user.id
    # )
  end
end
