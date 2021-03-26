class MeetingRoom < ApplicationRecord
  has_many :chats

  # 部屋の情報から参加者の情報を取得
  has_many :room_users, class_name: "RoomUser", foreign_key: "meeting_room_id"
  has_many :members, through: :room_users, source: :user
end
