class Hookup < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend
  # Remember to create a migration!
end
