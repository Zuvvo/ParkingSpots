class RegistrationController < ApplicationController
  def new
    if Current.user.present?
      redirect_to root_path, notice: "Can't enter this page. You are already logged in. Please logout."
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    unless @user.nil? then @user.email.downcase! end
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end