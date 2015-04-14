class AddImageToDramas < ActiveRecord::Migration
  def change
    add_column :dramas, :image, :string
  end
end
