class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name
      t.string :last_name
  		t.string :email
  		t.string :fb_id
      t.string :sexual_pref
  		t.string :fb_access_token
  		t.date :fb_expiration_date
      t.integer :index_bookmark

  		t.timestamps
  	end
  end
end
