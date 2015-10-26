class User < ActiveRecord::Base
	has_many :posts

	has_many :user_drinks
	# 'through:... ' is a ruby hash
	has_many :drinks, through: :user_drinks

	validates :password, confirmation: true, presence: true
	validates :fname, presence: true, uniqueness: true

	def to_s
		"User(firstname=#{self.fname}, lastname=#{self.lname})"
	end

	validates :fname, presence: true
	validates :lname, presence: true
	validates :password, presence: true, length: {in: 10..12}
	validates :email, presence: true, uniqueness: true
	before_save :fix_phone_number, :fix_email


	#if we have a phone number
	# => remove spaces
	# => convert letters to numbers

	def fix_phone_number
		puts "TROY >>>>>>>>>>>>>>>>>>> User.before_save()"
		updated = self.phone_number.gsub("\s", "")
		self.phone_number = updated
	end

	def fix_email
		updated = self.email.downcase
		self.email = updated
	end

	scope :cool_names, lambda {
		where('LENGTH(fname)+LENGTH(lname) <= 9')
	}

	scope :created_in_last_hour, lambda {
		where('created_at between ? and ? ', Time.now-1.hour, Time.now)
	}

	scope :active_in_last_day, lambda {
		all.select { |user| 
			user.posts.where('created_at >= ?', Time.now - 1.day).count > 0
		}
	}

	scope :inactive_in_last_day, lambda {
		all.select { |user| 
			user.posts.where('created_at >= ?', Time.now - 1.day).count == 0
		}
	}

	# upper, lower case, numbers
	scope :secure_passwords, lambda {
		where('1=2')
	}

	scope :scope_people_who_drink, lambda {
		all.select { |user| 
			user.user_drinks.count > 0
		}
	}

	def self.method_people_who_drink
		User.all.select { |user|
			user.user_drinks.count > 0
		}
	end
end
