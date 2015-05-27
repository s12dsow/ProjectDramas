class User < ActiveRecord::Base
  devise :database_authenticatable
  devise :registerable
  devise :recoverable
  devise :rememberable
  devise :trackable
  devise :validatable
  devise :omniauthable
  devise omniauth_providers: [:facebook]

  has_many :user_dramas
  has_many :dramas, through: :user_dramas

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
end
