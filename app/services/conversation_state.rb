class ConversationState
  include Rails.application.routes.url_helpers
  def self.get_response(message_trigger)
    if is_reserve_word?(message_trigger)
      content = "Login using this link: " + Shortener::ShortenedUrl.generate(Rails.application.routes.url_helpers.provider_auth_path("instagram"), host: CANONICAL_HOST).to_s
      return content
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