require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
	def setup
		@reply = Reply.new(answer: "tarefa", score: 50)
		@reply_score = Reply.new(answer: "tarefa", score: 90)
	end

	test "should be valid" do
		assert @reply.valid?
	end

	test "answer should be present" do
		@reply.answer = "     "
		assert_not @reply.valid?
	end

	test "score should be over 60" do
		assert_not @reply.score > 60
		assert @reply_score.score > 60
	end
end
