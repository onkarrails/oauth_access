class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid, :oauth_token, :oauth_expires_at
  # attr_accessible :title, :body
  devise :omniauthable, :omniauth_providers => [:facebook,:twitter]
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def self.find_for_omni_oauth(auth, signed_in_resource=nil)
      
    email1 = auth.info.nickname << "@twitter.com" || auth.info.email if auth.info.nickname

    user = User.where(:provider => auth.provider, :uid => auth.uid).first || User.create(  provider:auth.provider, uid:auth.uid, 
                      email: email1,
                      password:Devise.friendly_token[0,20]
                      )
    unless user
      user.ensure_authentication_token!
    end
    user
  end
end
