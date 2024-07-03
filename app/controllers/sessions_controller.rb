class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_by(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have been successfully logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "You have been logged out!"
  end
end
