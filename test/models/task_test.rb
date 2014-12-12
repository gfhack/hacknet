require 'test_helper'

class TaskTest < ActiveSupport::TestCase
	def setup
		@task = Task.new(title: "tarefa", text: "descrição da tarefa")
	end

	test "should be valid" do
		assert @task.valid?
	end

	test "title should be present" do
		@task.title = "     "
		assert_not @task.valid?
	end

	test "text should be present" do
		@task.text = "     "
		assert_not @task.valid?
	end
end
