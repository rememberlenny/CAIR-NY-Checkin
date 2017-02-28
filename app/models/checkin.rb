class Checkin < ActiveRecord::Base
  def self.generate_pair(phone)
    phone = Phonelib.parse(phone)
    url_id = SecureRandom.hex
    sanitized_phone = phone.sanitized 
    if Checkin.where(phone_number: sanitized_phone).count == 0
      checkin = Checkin.new(phone_number: sanitized_phone, hex_id: url_id)
      checkin.save
    else
      checkin = Checkin.where(phone_number: sanitized_phone).first
    end
    checkin.hex_id
  end
end