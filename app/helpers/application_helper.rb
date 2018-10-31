module ApplicationHelper
	
	include ReachoutsHelper
	include NavigationHelper
	include Private::ConversationsHelper
	include Private::MessagesHelper 
	include Group::ConversationsHelper
	include Group::MessagesHelper
	
	def private_conversations_windows
		params[:controller] != 'messengers' ? @private_conversations_windows : []
	end
	
	def group_conversations_windows
		params[:controller] != 'messengers' ? @group_conversations_windows : []
	end

	def first_name(email)
    	email.split(".").first
  	end

  	def last_name(email)
    	email.split(".")[1].split("@").first
  	end

  	def current_class?(test_path)
    	return 'active' if request.path == test_path
    	''
  	end
end
