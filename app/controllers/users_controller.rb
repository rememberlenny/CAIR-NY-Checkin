class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    range = (Date.today..6.months.from_now)
    months = range.to_a.map(&:beginning_of_month).uniq
    @months = months.map { |date| date.strftime('%Y %b') } 
  end
end
