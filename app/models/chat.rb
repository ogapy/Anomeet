class Chat < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :user
  has_many :notifications, dependent: :destroy
  has_many :favorites

  after_create_commit { ChatBroadcastJob.perform_later self }
  
end
