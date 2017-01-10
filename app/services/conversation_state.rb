class ConversationState
  def self.get_response(message_trigger)
    conversation_responses = ConversationResponse.where(trigger: message_trigger)
    if conversation_responses.count == 0
      "Sorry. I dont understand."
    else
      conversation_response = conversation_responses.sample
      conversation_response.statement
    end
  end
end