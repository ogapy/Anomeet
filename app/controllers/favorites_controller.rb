class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new(chat_id: params[:chat_id])
    @favorite.save
    chat = Chat.find(params[:chat_id])
    create_notification_favorite(
      current_user,
      chat.user.id,
      chat.id
    )
  end

  def destroy
    @favorite = current_user.favorites.find_by(chat_id: params[:chat_id])
    @favorite.destroy
  end

  private def create_notification_favorite(sender, receiver_id, chat_id)
    is_already_favorited = Notification.where(sender_id: sender.id, receiver_id: receiver_id, chat_id: chat_id, action: "favorite")
    if is_already_favorited.blank?
      Notification.create!(
        sender_id: sender.id,
        receiver_id: receiver_id,
        chat_id: chat_id,
        action: "favorite"
      )
    end
  end
  
end
