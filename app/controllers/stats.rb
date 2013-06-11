get '/stats' do 
	redirect to '/' if !current_user
	@chicks = current_user.friends
	@chick_count = current_user.friends.count
	erb :stats
end