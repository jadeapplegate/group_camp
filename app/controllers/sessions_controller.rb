class SessionsController < ApplicationController

  #GET /sessions/new
  def new
  end

  #POST /sessions
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to trips_search_path
    else
      flash[:error]='Invalid email address/password combination'
      redirect_to signin_path
    end
  end

#DELETE /sessions/1
  def destroy
    sign_out
    redirect_to root_url
  end

end
