class Notification < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :recever, class_name: "User", foreign_key: 'recever_id'
  belongs_to :chat
end
