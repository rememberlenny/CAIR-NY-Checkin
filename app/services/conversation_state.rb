class ConversationState
  def self.get_response(message_id)
    message = Message.find(message_id)
    conversation_responses = ConversationResponse.where(trigger: message.message)
    conversation_response = responses.sample
  end
end