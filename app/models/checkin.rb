class Checkin < ActiveRecord::Base
  def self.send_token(hex)
    checkin = Checkin.where(hex_id: hex)
    if checkin.count == 0
      return false
    end
    checkin_id = checkin.first.id
    token_key = rand(9999).to_s.center(4, rand(9).to_s)
    token = AuthToken.new(checkin_id: checkin_id, token: token_key)

    token.save
    token 
  end

  def self.validate_token(token, hex)
    checkin = Checkin.where(hex_id: hex)
    if checkin.count == 0
      return false
    else
      checkin = checkin.first
    end
    
    checkin_id = checkin.id
    auth = AuthToken.where(token: token, checkin_id: checkin_id)
    
    if auth.count == 1
      checkin.status = "valid"
      checkin.save
      true
    else
      false
    end
  end

  def self.generate_pair(phone)
    phone = Phonelib.parse(phone)
    url_id = SecureRandom.hex
    sanitized_phone = phone.sanitized 
    if Account.where(phone: sanitized_phone).count == 0
      account = Account.find_or_create_by(phone: sanitized_phone)
      checkin = Checkin.new(account_id: account.id, hex_id: url_id, status: "new")
      checkin.save
      account.save
    else
      account = Account.where(phone: sanitized_phone).first
      checkin = Checkin.where(account_id: account.id).first
    end

    checkin
  end
end