class CreateTagsTable < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
  		t.string :name
  	end
  end
end
