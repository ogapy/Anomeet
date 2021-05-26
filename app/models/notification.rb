class Notification < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "User", foreign_key: 'receiver_id'
  belongs_to :chat

  enum action: [:disclose, :favorite]

  after_create_commit { NotificationBroadcastJob.perform_later self }
end
