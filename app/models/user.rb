class User < ActiveRecord::Base
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:google_oauth2]
  # attr_accessor :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :avatar
  
  after_create :skip_conf!

  def skip_conf!
    self.confirm! # if Rails.env.development?
  end
  
  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        #user.username = auth.info.name
        user.email = auth.info.email
      end
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.user_attributes"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def to_s
    self.email
  end
  
end
