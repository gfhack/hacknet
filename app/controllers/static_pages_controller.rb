class StaticPagesController < ApplicationController
	include SessionsHelper
	
	def home
		if current_user
			@tasks = Task.all
		end
	end

	def help
	end

	def about
	end

	def contact
	end
end
