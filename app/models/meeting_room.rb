class MeetingRoom < ApplicationRecord
  has_many :chats, dependent: :destroy

  # 部屋の情報から参加者の情報を取得
  has_many :room_users, class_name: "RoomUser", foreign_key: "meeting_room_id", dependent: :destroy
  has_many :members, through: :room_users, source: :user, dependent: :destroy

  # 部屋のリーダーを取得
  belongs_to :leader, class_name: "User", foreign_key: "leader_id"
end
