class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
  end

  def speak(data)
    NotificationController.create_notification_show_name(
      User.find(current_user), data[:receiver_id], data[:chat_id]
    )
  end
end
