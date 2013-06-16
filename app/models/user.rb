class User < ActiveRecord::Base
	has_many :hookups
	has_many :friends, :through => :hookups

	def get_facebook_user_img
		"https://graph.facebook.com/" + fb_id.to_s + "/picture"
	end
end
