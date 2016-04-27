class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer :user_id
  		t.string :body
  		t.integer :rating
  		t.boolean :explicit
  	end
  end
end
