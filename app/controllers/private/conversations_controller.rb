class Private::ConversationsController < ApplicationController
    
    def create
        recipient_id = params[:user_id]
        #puts "recipient_id: #{recipient_id}" 
        
        @conversation = Private::Conversation.new(sender_id: current_user.id, 
                                                recipient_id: recipient_id)
        
        if @conversation.save
          
          #puts "conversation: #{@conversation.inspect}"
          add_to_conversations unless already_added?
          
          #puts "Current conversations: #{session[:private_conversations].inspect}"
          
          respond_to do |format|
            format.js {render partial: 'private/conversations/open'}
          end
        end
      end
    
      def close
        @conversation_id = params[:id].to_i
        session[:private_conversations].delete(@conversation_id)
     
        respond_to do |format|
          format.js
        end
      end
    
      def open
        @conversation = Private::Conversation.find(params[:id])
        add_to_conversations unless already_added?
        respond_to do |format|
          format.js { render partial: 'private/conversations/open' }
        end
      end
    
      private
    
      def add_to_conversations
        session[:private_conversations] ||= []
        session[:private_conversations] << @conversation.id
      end
    
      def already_added?
        session[:private_conversations].include?(@conversation.id)
      end
end
