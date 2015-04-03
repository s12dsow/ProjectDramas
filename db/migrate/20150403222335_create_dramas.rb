class CreateDramas < ActiveRecord::Migration
  def change
    create_table :dramas do |t|
      t.string :name
      t.text :summary
      t.string :content_url

      t.timestamps null: false
    end
  end
end
