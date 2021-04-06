Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  post 'search' => 'meeting_rooms#search_room'
  post 'enter_room' => 'meeting_rooms#enter_room'
  resources :meeting_rooms, only: [:index, :show, :create]
  post 'apply' => 'chats#apply_for_name_disclosure'
  resources :chats, only: [:create, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :notifications, only: [:index]
end
