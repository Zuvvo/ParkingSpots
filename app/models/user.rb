class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "must be valid email address"}
  validates :password, presence: true

end
