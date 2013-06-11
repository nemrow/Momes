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
end