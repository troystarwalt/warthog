class User < ActiveRecord::Base
	has_many :posts

	has_many :user_drinks
	# 'through:... ' is a ruby hash
	has_many :drinks, through: :user_drinks
end
