class Task < ActiveRecord::Base
	has_many :replies

	validates :title,  presence: true
	validates :text,  presence: true
end