class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
    rename_table :user_dramas, :collections
  end
end
