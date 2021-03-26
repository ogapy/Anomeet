class RoomUser < ApplicationRecord
  belongs_to :meeting_room_id
  belongs_to :user_id
end
