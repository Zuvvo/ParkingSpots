class OmniauthCallbacksController < ApplicationController

  def slack
      slack_account = SlackAccount.new
      #Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
      slack_account.update(
      username: auth.info.username,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
      )

    redirect_to root_path, notice: "Successfully connected your Slack account."
  end

  def auth
    request.env['slack.auth']
  end

end