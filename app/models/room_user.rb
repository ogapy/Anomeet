class RoomUser < ApplicationRecord
  belongs_to :meeting_room, dependent: :destroy
  belongs_to :user, dependent: :destroy

  
end
