class CreateUserFollowsTable < ActiveRecord::Migration
  def change
  	create_table :user_follows do |t|
  		t.integer :follower_id
  		t.integer :followee_id
  	end
  end
end
