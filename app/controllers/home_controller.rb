class HomeController < ApplicationController

#GET /
  def index
    @user = current_user || User.new
    @trips = @user ? @user.trips : []
  end

end