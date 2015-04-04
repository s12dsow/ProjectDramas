class User < ActiveRecord::Base
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_dramas
  has_many :dramas, through: :user_dramas
end
