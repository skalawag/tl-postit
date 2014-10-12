class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome #{params[:username]}"
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:error] = "Username or password was not recognized. Try again or register."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're logged out. Bye!"
  end
end
