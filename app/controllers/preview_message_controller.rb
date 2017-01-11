class PreviewMessageController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!
  respond_to :html, :json

  def show
    @number = params[:number]
    account = Account.where(phone: @number).first
    @messages = Message.where(account_id: account.id)
  end

  def submit
    respond_to do |format|
      message = params[:message]
      @number = params[:number]
      account = Account.where(phone: @number).first
      response = Message.create_on_account(account.id, message, false)
      format.json { render json: response }
    end
  end
end
