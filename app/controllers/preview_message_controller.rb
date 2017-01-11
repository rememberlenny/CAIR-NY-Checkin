class PreviewMessageController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  respond_to :html, :json, :js

  def show
    @number = params[:number]
    account = Account.where(phone: @number).first
    @messages = Message.where(account_id: account.id)
  end

  def submit
    message = params[:message]
    @number = params[:number]
    account = Account.where(phone: @number).first
    text_response = Message.create_on_account(account.id, message, false)

    render json: {status: "success", message: text_response}
  end
end
