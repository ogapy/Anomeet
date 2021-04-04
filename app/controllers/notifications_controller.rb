class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.where.not(sender_id: current_user.id)
    @notifications.where(is_checked: false).each do |notification|
      notification.update(is_checked: true)
    end
  end
  
end
