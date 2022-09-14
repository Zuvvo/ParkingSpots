class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

  def new
    if Current.user.present?
      redirect_to root_path, notice: "Can't enter this page. You are already logged in."
    end
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in"
    else
      # flash[:alert] = "Invalid email or password"
      render :new
    end
  end
end