class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast 'notification_channel', { notification_content: render_notification(notification)}
  end

  private
    def render_notification(notification)
      ApplicationController.render_with_signed_in_user(
        notification.sender, partial: 'notifications/notification', locals: { notification: notification }
      )
    end
end
