module UsersHelper
    include Private::ConversationsHelper

    def get_private_conversation(user)
        conversation = Private::Conversation.between_users(current_user.id, user.id)
        conversation = conversation[0]
    end

    def open_private_conversation_partial_path(conversation)
        if private_conversation_exists(conversation)
            "users/conversations/conversation/open_private_conversation"
        else
            "shared/empty_partial"
        end
    end

    def create_private_conversation_partial_path(conversation, user)
        if private_conversation_exists(conversation) == true || current_user.id == user.id
            "shared/empty_partial"
        else
            "users/conversations/conversation/create_private_conversation"
        end
    end

    private

    def private_conversation_exists(conversation)
        conversation.present?
    end
        
end