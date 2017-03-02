class TextExchangeController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def next_step
    @hex = params[:id]
    checkin = Checkin.where(hex_id: @hex).last


    if checkin.status == "valid"
      redirect_to required_information_path(id: checkin.hex_id)
    elsif checkin.status == "complete"
      redirect_to thanks_path(id: checkin.hex_id)
    elsif checkin.status == "new"

    else

    end
  end

  def addition_information_update
    @hex = params[:checkin][:hex_id]
    checkin = Checkin.where(hex_id: @hex).last
    checkin.assign_attributes(params[:checkin].permit(:name_first, :name_middle, :name_last, :address_line_one, :address_line_two, :address_city, :address_state, :address_zip, :interview_location, :interview_date, :interview_time, :contact_one_name_first, :contact_one_name_last, :contact_one_phone_number, :contact_one_prefered_languag, :alt_phone_number))
    
    checkin.status = "complete"
    
    checkin.save

    redirect_to next_step_path(id: @hex)
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
      redirect_to next_step_path(id: hex)
    else
      redirect_to confirm_check_path(id: hex), :flash => { :error => "Invalid authorization code." }
    end
  end

  def additional_information
    @hex = params[:id]
    @checkin = Checkin.where(hex_id: @hex).last
  end

  def thanks
    @hex = params[:id]
    @checkin = Checkin.where(hex_id: @hex).last
  end

  def checkin
  end

  def alt_confirm
  end
end
