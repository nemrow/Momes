class Friend < ActiveRecord::Base
	has_many :hookups
	has_many :users, :through => :hookups

	def full_name
		begin
		first_name + ' ' + last_name
		rescue
			puts "broken"
		end
	end

	def get_facebook_user_img
		"https://graph.facebook.com/" + fb_id.to_s + "/picture"
	end
end