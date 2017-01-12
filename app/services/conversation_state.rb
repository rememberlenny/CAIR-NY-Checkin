class ConversationState
  include Rails.application.routes.url_helpers
  def self.get_response(message_trigger)
    reserve_response = nil

    if message_trigger == "login"
      reserve_response = self.login_process
    elsif message_trigger == "summary"
      reserve_response = self.summary_process
    elsif message_trigger == "followers"
      reserve_response = self.followers_process
    elsif message_trigger == "comments"
      reserve_response = self.comments_process
    elsif message_trigger == "focus"
      reserve_response = self.focus_process
    end

    if reserve_response.nil?
      return reserve_response
    end

    conversation_responses = ConversationResponse.where("lower(trigger) = ?", message_trigger.downcase)
    
    if conversation_responses.count == 0
      "Sorry. I dont understand."
    else
      conversation_response = conversation_responses.sample
      conversation_response.statement
    end
  end

  def self.summary_process
    "working summary_process"
  end

  def self.followers_process
    "working followers_process"
  end

  def self.comments_process
    "working comments_process"
  end

  def self.focus_process
    "working focus_process"
  end

  def self.login_process
    host_url = Rails.application.config.settings.CANONICAL_HOST
    instagram_login_url = Rails.application.routes.url_helpers.provider_auth_path("instagram", host: host_url)
    short_login_url = Shortener::ShortenedUrl.generate(instagram_login_url)
    content = "Login using this link: " + "http://" + host_url + instagram_login_url + "?flow=signup"
    return content
  end
end