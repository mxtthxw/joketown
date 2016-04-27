class CreatePostCommentsTable < ActiveRecord::Migration
  def change
  	create_table :post_comments do |t|
  		t.integer :post_id
  		t.integer :comment_id
  	end
  end
end
