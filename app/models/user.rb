class User < ApplicationRecord

  has_one :slack_account

  has_secure_password

  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "must be valid email address"}
  validates :password, presence: true

  def self.logged_in?
    not (@user.nil? && Current.user.present?)
  end

  def has_slack_account?

  end

end
