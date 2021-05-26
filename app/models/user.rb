class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :chats, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # ユーザ情報から参加している部屋の情報を取得
  has_many :room_users, dependent: :destroy
  has_many :attending_rooms, through: :room_users, source: :meeting_room, dependent: :destroy

  # リーダーとなっている部屋を取得
  has_many :leader_rooms, class_name: "MeetingRoom", foreign_key: "leader_id", dependent: :destroy

  # 自分が飛ばした通知
  has_many :active_notifications, class_name: "Notification", foreign_key: "sender_id", dependent: :destroy

  # 自分に飛んできた通知
  has_many :passive_notifications, class_name: "Notification", foreign_key: "receiver_id", dependent: :destroy

  def already_favorited?(chat)
    favorites.where(chat: chat).exists?
  end
  
end
