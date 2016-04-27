class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :password
  		t.string :firstname
  		t.string :lastname
  		t.integer :age
  		t.datetime :birthday
  		t.string :bio
  		t.boolean :moderator
  	end
  end
end
