class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :collections, :watched?, :watched
  end
end
