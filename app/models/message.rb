class Message < ActiveRecord::Base

  def self.create_on_account(account_id, message)
    mm = Message.new(account_id: account_id, message: message)
    mm.save
  end
end
