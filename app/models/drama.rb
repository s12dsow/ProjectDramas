class Drama < ActiveRecord::Base
	has_many :user_dramas
	has_many :dramas, through: :user_dramas

	def self.get_drama(id)
		TVDB.build_drama(id)
	end
end
