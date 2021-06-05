class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast 'meeting_rooms_channel', { chat_content: render_chat_message(chat), chat_id: chat.id }
  end

  private
    def render_chat_message(chat)
      ApplicationController.render_with_signed_in_user(chat.user, partial: 'chats/chat', locals: { chat: chat, current_user: chat.user })
    end
end
