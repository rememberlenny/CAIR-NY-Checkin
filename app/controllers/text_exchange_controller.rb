class TextExchangeController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def next_step
    render text: "blah"
  end

  def confirm
    phone_number = params[:telephone]
    if phone_number && phone_number.empty?
      redirect_to root_path, :flash => { :error => "Please submit a phone number." }
    elsif Phonelib.valid?(phone_number)
      checkin = Checkin.generate_pair(phone_number)
      if checkin.status == "verified"
        redirect_to next_step_path(id: checkin.hex_id)
      else
        redirect_to confirm_check_path(id: checkin.hex_id)
      end
    else
      redirect_to root_path, :flash => { :error => "#{phone_number} is an invalid number." }
    end
  end

  def confirm_check
    @hex = params[:id]
    state = Checkin.send_token(@hex)
    if state == false
      redirect_to root_path, :flash => { :error => "This url does not exist." }
    end
  end

  def check_token_authenticity
    token = params[:auth_code]
    hex = params[:hex_code]
    if Checkin.validate_token(token, hex)
      redirect_to next_step_path(id: hex), :flash => { :notice => "Invalid authorization code." }
    else
      redirect_to confirm_check_path(id: hex), :flash => { :error => "Invalid authorization code." }
    end
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
