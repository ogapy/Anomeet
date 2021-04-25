class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.where.not(sender_id: current_user.id)
    @notifications.where(is_checked: false).each do |notification|
      notification.update(is_checked: true)
    end
  end

  def show_modal
    @chat = Chat.find(params[:chat_id])
    session[:chat_content] = @chat.content
    session[:user_name] = @chat.user.name
  end
  
end
