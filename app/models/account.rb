class Account < ActiveRecord::Base
  def self.process_phone(phone)
    accounts = Account.where(phone: phone)
    if accounts.count == 0
      account = Account.new(phone: phone)
      account.save
    else
      account = accounts.first
    end
  end
end
