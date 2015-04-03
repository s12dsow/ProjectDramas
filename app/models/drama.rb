class Drama < ActiveRecord::Base
	has_many :user_dramas
	has_many :dramas, through: :user_dramas

end
