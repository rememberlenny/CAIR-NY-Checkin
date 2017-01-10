class ConversationState < ActiveRecord::Base

  def self.get_response(message_id)
    message = Message.find(message_id)
  end

end
