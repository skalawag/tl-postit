class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username}"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
