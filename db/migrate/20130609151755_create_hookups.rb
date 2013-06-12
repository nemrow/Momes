class CreateHookups < ActiveRecord::Migration
  def change
  	create_table :hookups do |h|
  		h.integer :user_id
  		h.integer :friend_id
  	end
  end
end
