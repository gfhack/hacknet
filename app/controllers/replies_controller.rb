class RepliesController < ApplicationController
	include SessionsHelper

	def index
		@task = Task.find(params[:task_id])
		@replies = @task.replies.paginate(page: params[:page])
	end

	def new
		@task = Task.find(params[:task_id])
		@reply = @task.replies.new
	end

	def create
		@task = Task.find(params[:task_id])
		@reply = @task.replies.new(reply_params)
		@reply.user = current_user
	    if @reply.save
	      flash[:info] = "Respondido com sucesso!"
	  	end

	    redirect_to task_replies_url(@task)
	end

	def destroy
		Reply.find(params[:id]).destroy
		flash[:success] = "Resposta deletada"
		redirect_to replies_url
	end

	def show
	    @reply = Reply.find(params[:id])
	end

	def edit
		@task = Task.find(params[:task_id])
		@reply = @task.replies.find_by(user_id: current_user.id)
	end

	def update
		@task = Task.find(params[:task_id])
		@reply = @task.replies.find_by(user_id: current_user.id)

		if @reply.update_attributes(reply_params)
			flash[:success] = "Resposta atualizada"
			redirect_to [@task, @reply]
		else
			render 'edit'
		end
	end

	private

	def reply_params
		params.require(:reply).permit(:answer)
	end
end