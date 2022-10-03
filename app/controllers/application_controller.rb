class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(uid: session[:user_uid])
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end