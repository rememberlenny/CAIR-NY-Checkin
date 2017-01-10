class Message < ActiveRecord::Base
  def self.create_on_account(account_id, message)
    message = Message.new(account_id: account_id, message: message)
    message.save

    determine_response(account_id, message.id)
  end

  def self.determine_response(account_id, message_id)
    setup_twilio
    message = Message.find(message_id)
    account = Account.find(account_id)
    account_messages = Message.where(account_id: account_id)
    content = "(" + account_messages.count.to_s + ")"
    @client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: account.phone, body: content)
  end

  def self.setup_twilio
    @client = Twilio::REST::Client.new
  end
end
