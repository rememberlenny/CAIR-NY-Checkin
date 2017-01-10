class Message < ActiveRecord::Base

  def self.create_on_account(account_id, message)
    message = Message.new(account_id: account_id, message: message)
    message.save

    determine_response(message.id)
  end

  def self.determine_response(message_id)
    message = Message.find(message_id)
  end
end
