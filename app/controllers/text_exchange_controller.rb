class TextExchangeController < ApplicationController
  skip_authorization_check
  skip_before_action :authenticate_user!

  def confirm
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
