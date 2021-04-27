class Chat < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :user
  has_many :notifications, dependent: :destroy
  has_many :favorites

  # def create_notification_show_name(current_user)
  #   is_already_disclosed = Notification.where(sender_id: current_user.id, receiver_id: user_id, chat_id: id, action: "disclose")
  #   if is_already_disclosed.blank?
  #     notification = current_user.active_notifications.new(
  #       receiver_id: user_id,
  #       chat_id: id,
  #       action: "disclose"
  #     )
  #   end

  #   if notification.sender_id == notification.receiver_id
  #     notification.is_checked = true
  #   end

  #   notification.save!
  # end
  
end
