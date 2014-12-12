class Reply < ActiveRecord::Base
	belongs_to :task
	belongs_to :user

	validates :answer,  presence: true
end