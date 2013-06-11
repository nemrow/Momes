get '/pref' do 
	if current_user
		redirect to '/play' if current_user.sexual_pref
		erb :pref
	else
		redirect to '/'
	end
end