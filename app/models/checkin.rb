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

  def self.generate_pair(phone)
    phone = Phonelib.parse(phone)
    url_id = SecureRandom.hex
    sanitized_phone = phone.sanitized 
    if Checkin.where(phone_number: sanitized_phone).count == 0
      checkin = Checkin.new(phone_number: sanitized_phone, hex_id: url_id, status: "new")
      checkin.save
    else
      checkin = Checkin.where(phone_number: sanitized_phone).first
    end

    checkin
  end
end