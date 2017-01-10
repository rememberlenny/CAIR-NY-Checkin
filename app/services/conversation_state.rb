class ConversationState

  def self.get_response(message_id)
    message = Message.find(message_id)
    return false
  end

end
