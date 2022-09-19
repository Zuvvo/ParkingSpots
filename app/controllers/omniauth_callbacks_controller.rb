class OmniauthCallbacksController < ApplicationController

  def slack
      render plain: auth
  end

  def auth
    request.env['omniauth.auth']
  end

end