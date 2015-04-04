class CreateUserDramas < ActiveRecord::Migration
  def change
    create_table :user_dramas do |t|
      t.references :user, index: true
      t.references :drama, index: true
      t.boolean :watched?
      t.integer :rating
      t.text :review

      t.timestamps null: false
    end
    add_foreign_key :user_dramas, :users
    add_foreign_key :user_dramas, :dramas
  end
end
