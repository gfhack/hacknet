class RankingController < ApplicationController
	def index
		@replies = Reply.order(:score).all
		@replies = @replies.reverse_each.map
	end
end
