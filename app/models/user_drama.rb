class UserDrama < ActiveRecord::Base
  belongs_to :user
  belongs_to :drama
end
