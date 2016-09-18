module Chat
  class MessagesController < ApplicationController
    before_action :require_login
    before_action :set_conversation

    def create
      @conversation.messages.create(message_params)

      head :ok
    end

    def destroy
      @conversation.destroy
    end

    private

    def set_conversation
      @conversation = Chat::Conversation.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:text, :image).merge(
        user_id: current_user.id
      )
    end
  end
end
