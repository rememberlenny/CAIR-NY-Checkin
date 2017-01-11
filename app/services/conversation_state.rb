class ConversationState
  include Rails.application.routes.url_helpers
  def self.get_response(message_trigger)
    if is_reserve_word?(message_trigger)
      host_url = Rails.application.config.settings.CANONICAL_HOST
      instagram_login_url = Rails.application.routes.url_helpers.provider_auth_path("instagram", host: host_url)
      short_login_url = Shortener::ShortenedUrl.generate(instagram_login_url)
      content = "Login using this link: " + "http://" + host_url + instagram_login_url + "?flow=signup"
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