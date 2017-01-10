class ConversationState
  def self.get_response(message_trigger)
    if is_reserve_word?(message_trigger)
      return "Login using this link: "
    end

    conversation_responses = ConversationResponse.where("lower(trigger) = ?", message_trigger.downcase)
    
    if conversation_responses.count == 0
      "Sorry. I dont understand."
    else
      conversation_response = conversation_responses.sample
      conversation_response.statement
    end
  end

  def self.is_reserve_word?(word)
    ["login"].include? word.downcase
  end
end