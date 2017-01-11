class Message < ActiveRecord::Base
  validates :account_id, :message, :direction, presence: true

  def self.create_on_account(account_id, message, should_send = true)
    message = Message.new(account_id: account_id, message: message, direction: "in")
    message.save

    content = determine_response(account_id, message.id)

    if !Rails.env.test? && should_send
      send_message(account_id, content)
    end

    content
  end

  def self.send_message(account_id, content)
    message = Message.new(account_id: account_id, message: content, direction: "out")
    message.save
    account = Account.find(account_id)
    
    if !Rails.env.test?
      setup_twilio
      @client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: account.phone, body: content)
    end
  end

  def self.determine_response(account_id, message_id)
    message = Message.find(message_id)
    content = ConversationState.get_response(message.message)
    
    if Rails.env.development?
      account_messages = Message.where(account_id: account_id, direction: "in")
      content = content + " (" + account_messages.count.to_s + ")"
    end
    
    content
  end

  def self.setup_twilio
    @client = Twilio::REST::Client.new
  end
end
