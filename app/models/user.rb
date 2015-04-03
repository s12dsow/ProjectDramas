class User < ActiveRecord::Base

	has_secure_password
	
	has_many :user_dramas
	has_many :dramas, through: :user_dramas
end
