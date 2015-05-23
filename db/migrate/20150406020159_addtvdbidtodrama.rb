class Addtvdbidtodrama < ActiveRecord::Migration
  def change
    add_column :dramas, :tvdbid, :integer
  end
end
