class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :chats, dependent: :destroy

  # ユーザ情報から参加している部屋の情報を取得
  has_many :room_users, dependent: :destroy
  has_many :attending_rooms, through: :room_users, source: :meeting_room

  # リーダーとなっている部屋を取得
  has_many :leader_rooms, class_name: "MeetingRoom", foreign_key: "leader_id"

  #
  has_many :active_notifications, class_name: "Notification", foreign_key: "sender_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "receiver_id", dependent: :destroy
end
