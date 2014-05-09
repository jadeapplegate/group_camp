class HomeController < ApplicationController

  def index
    @user = current_user
    @trips = @user ? @user.trips : []
  end

end

# 1.
# if @user
#   @trips = @user.trips
# else
#   @trips = []
# end

# 2. 
# @trips = if @user
#   @user.trips
# else
#   []
# end