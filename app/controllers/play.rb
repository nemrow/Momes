get '/play' do
	redirect to '/' if !current_user
	current_user.update_attributes(:sexual_pref => params[:pref]) if params[:pref]
	@friends = get_all_friends[current_user.index_bookmark,15]
	@batch_end_index = current_user.index_bookmark + 15
	erb :play
end

post '/answer' do
	if !current_user
		redirect to '/'
	else
		# if the friend exists in our db
			# create hookup
		# else
			# all this should be background jobs
				# ping facebook with fb_id
				# create Friend object
				# create hookup 
		friend_info = params[:friend_info]
		p friend_info
		friend = Friend.find_or_create_by_fb_id(:fb_id => friend_info[:fb_id].to_i,
																						:first_name => friend_info[:first_name],
																						:last_name => friend_info[:last_name],
																						:gender => friend_info[:gender],
																						:img_url => get_facebook_user_img(friend_info[:fb_id])
																						)
		Hookup.create(	:user_id => current_user.id,
										:friend_id => friend.id
									)
	end
	index = current_user.index_bookmark + 1
	current_user.update_attributes(:index_bookmark => index)
end

post '/no_hookup' do 
	index = current_user.index_bookmark + 1
	current_user.update_attributes(:index_bookmark => index)
end

post '/get_more_slides' do 
	@friends = get_all_friends[params[:last_batch_ending_index].to_i,15]
	erb :more_friend_slides, :layout => false
end