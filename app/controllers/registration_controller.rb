class RegistrationController < ApplicationController
  def new
    if Current.user.present?
      redirect_to root_path, notice: "Can't enter this page. You are already logged in. Please logout."
    else
      @user = User.new
    end
  end

  def create
    user = User.new(user_params)
    user.email.downcase!

    if user.nil?
      @user = nil
      redirect_to root_path
      flash[:alert] = "Can't create account with given data."
      return
    end

    if User.exists?(:email => user.email)
      @user = nil
      redirect_to sign_up_path
      flash[:alert] = "Account with this email already exists."
      return
    end

    if user.save
      @user = user
      session[:user_id] = @user.id
      redirect_to sign_up_path, notice: "Account created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end