class Chat < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :user
end
