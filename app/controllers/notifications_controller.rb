class NotificationsController < ApplicationController

  def show_modal
    @chat = Chat.find(params[:chat_id])
    session[:user_id] = @chat.user.id
    session[:chat_id] = @chat.id
  end

  def apply_for_name_disclosure
    create_notification_show_name(
      current_user,
      session[:user_id],
      session[:chat_id]
    )
    session[:user_id] = nil
    session[:chat_id] = nil
  end

  private def create_notification_show_name(sender, receiver_id, chat_id)
      is_already_disclosed = Notification.where(sender_id: sender.id, receiver_id: receiver_id, chat_id: chat_id, action: "disclose")
      if is_already_disclosed.blank?
        notification = sender.active_notifications.new(
          receiver_id: receiver_id,
          chat_id: chat_id,
          action: "disclose"
        )
      end

      if notification.sender.id != notification.receiver_id
        notification.save!
      end
    end
  
end
