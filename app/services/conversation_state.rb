class ConversationState
  def self.get_response(message_trigger)
    conversation_responses = ConversationResponse.where(trigger: message_trigger)
    conversation_response = conversation_responses.sample(1).first
    conversation_response.statement
  end
end