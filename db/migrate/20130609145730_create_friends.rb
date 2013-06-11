class CreateFriends < ActiveRecord::Migration
  def change
  	create_table :friends do |f|
  		f.string :first_name
  		f.string :last_name
  		f.string :gender
  		f.string :img_url
  		f.integer :fb_id
  		f.timestamps
  	end
  end
end
