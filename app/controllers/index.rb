get '/' do
	# session[:user_id] = nil
  @users = User.all
  if session[:user_id]
		redirect to '/play' if current_user.sexual_pref
		redirect to '/pref'
	else
		@fb_login_link = FBHelper.get_login_link
	end
	erb :index
end


