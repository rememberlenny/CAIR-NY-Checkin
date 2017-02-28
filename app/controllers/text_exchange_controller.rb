class TextExchangeController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def confirm
    phone_number = params[:telephone]
    if phone_number && phone_number.empty?
      redirect_to root_path, :flash => { :error => "Please submit a phone number." }
    elsif Phonelib.valid?(phone_number)
      url_id = Checkin.generate_pair(phone_number)
      redirect_to confirm_check_path(id: url_id)
    else
      redirect_to root_path, :flash => { :error => "#{phone_number} is an invalid number." }
    end
  end

  def confirm_check
  end

  def additional_information
  end

  def thanks
  end

  def checkin
  end

  def alt_confirm
  end
end
