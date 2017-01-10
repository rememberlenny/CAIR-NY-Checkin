class SwitchboardController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  protect_from_forgery with: :null_session

  def sms
    phone = params[:From]
    message = params[:Body]
    Account.delay.process_phone(phone, message)
    render json: {status: "success", message: message.to_s, phone: phone.to_s}
  end

end
