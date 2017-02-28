class TextExchangeController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def confirm
    phone_number = params[:telephone]
    if Phonelib.valid?(phone_number)
      @params = params
    else
      redirect_to root_path, :flash => { :error => "#{phone_number} is an invalid number." }
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
