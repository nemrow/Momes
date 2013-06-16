get '/' do
	# session[:user_id] = nil
	if current_user
		@user = User.find(session[:user_id])
	  @friends = get_all_friends
	end
	@fb_login_link = FBHelper.get_login_link
  # @friends = Friend.limit(2)
	erb :index
end


