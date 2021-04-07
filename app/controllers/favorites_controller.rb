class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new(chat_id: params[:chat_id])
    @favorite.save
  end

  def destroy
    @favorite = current_user.favorites.find_by(chat_id: params[:chat_id])
    @favorite.destroy
  end
  
end
