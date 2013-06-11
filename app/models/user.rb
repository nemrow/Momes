class User < ActiveRecord::Base
	has_many :hookups
	has_many :friends, :through => :hookups
end
