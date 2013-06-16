def get_all_friends
	friends_array = []
	friends = facebook_request("friends?fields=first_name,last_name,gender")
	friends["data"].each do |friend|
	friends_array << Friend.new(:first_name => friend["first_name"], 
									:last_name => friend["last_name"],
									:gender => friend["gender"],
									:img_url => get_facebook_user_img(friend["id"]),
									:fb_id => friend["id"])
	end
	friends_array
end

def facebook_request(params)
	fb_user = JSON.parse(open("https://graph.facebook.com/me/#{params}&access_token=#{fb_access_token}").read)
end

def get_facebook_user_img(id)
	"https://graph.facebook.com/#{id}/picture"
end

def fb_access_token
	current_user.fb_access_token
end
