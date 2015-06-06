class Drama < ActiveRecord::Base
  has_many :collections
  has_many :dramas, through: :collections

  def self.get_drama(id)
    TVDB.build_drama(id)
  end
end
