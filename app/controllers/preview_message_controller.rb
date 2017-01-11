class PreviewMessageController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def show
    @number = params[:number] 
  end
end
