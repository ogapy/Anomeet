Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :meeting_rooms, only: [:index, :show, :create]
  resources :chats, only: [:create, :update]
end
