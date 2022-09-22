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
  validates :nickname, presence: true, uniqueness: {case_sensitive: false }
  #validate :validate_nickname
  attr_writer :login

  def login
    @login || nickname
  end

  def validate_nickname
    if User.where(email: nickname).exists?
      errors.add(:nickname, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase}]).first
    elsif conditions.has_key?(:nickname) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

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