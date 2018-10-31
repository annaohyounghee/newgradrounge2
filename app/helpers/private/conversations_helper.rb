module Private::ConversationsHelper
    include Shared::ConversationsHelper

  # get the opposite user of the conversation
  def private_conv_recipient(conversation)
    conversation.opposed_user(current_user)
  end

  # if the conversation has unshown messages, create a link to get them
  def load_private_messages(conversation)
    if conversation.messages.count > 0 
      'private/conversations/conversation/messages_list/link_to_previous_messages'
    else
      'shared/empty_partial'
    end 
  end

  # decide to show an option or not
  def add_to_contacts_partial_path(contact)
    if recipient_is_contact? 
      'shared/empty_partial'
    else 
      non_contact(contact)
    end 
  end

  def get_contact_record(recipient)
    contact = Contact.find_by_users(current_user.id, recipient.id)
  end

  # decide which conversation heading style to show
  def conv_heading_class(contact)
    # show a conversation heading without or with options
    if unaccepted_contact_exists(contact)
     'conversation-heading-full'
    else
     'conversation-heading'
    end
  end

  def create_group_conv_partial_path(contact)
    if recipient_is_contact?
      'private/conversations/conversation/heading/create_group_conversation'
    else
      'shared/empty_partial'
    end
  end

  def contacts_except_recipient(recipient)
    contacts = current_user.all_active_contacts
    # return all contacts, except the opposite user of the chat
    contacts.delete_if {|contact| contact.id == recipient.id }
  end

  private

  def recipient_is_contact?
    # check if recipient is a user's contact
    contacts = current_user.all_active_contacts
    contacts.find {|contact| contact['id'] == @recipient.id}.present?
  end

end
