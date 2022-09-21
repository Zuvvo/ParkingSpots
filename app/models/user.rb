class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # has_secure_password
  # has_many :spots

  # validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "must be valid email address"}
  # validates :encrypted_password, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
    end
  end

  def self.logged_in?
    not (@user.nil? && Current.user.present?)
  end
end