class SwitchboardController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  protect_from_forgery with: :null_session

  def sms
    phone = params[:From]

    Account.delay.process_phone(phone)
    
    render json: {status: "success"}
  end

end
