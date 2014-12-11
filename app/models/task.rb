class Task < ActiveRecord::Base
	has_many :replies
end