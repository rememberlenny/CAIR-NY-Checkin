class PreviewMessageController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def show
    @number = params[:number]
    account = Account.where(phone: @number).first
    @messages = Message.where(account_id: account.id)
  end
end
