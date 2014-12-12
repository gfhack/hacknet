class TasksController < ApplicationController
	include SessionsHelper
	
	def index
		@tasks = Task.paginate(page: params[:page])
	end

	def new
		if current_user.admin?
			@task = Task.new
		else
			flash[:warning] = "Não tem permissão!"
			redirect_to tasks_url
		end
	end

	def create
		@task = Task.new(task_params)

	    if @task.save
	      flash[:info] = "Cadastrado com sucesso!"
	      redirect_to root_url
	    else
	      flash[:danger] = "Erro!"
	      render 'index'
	    end
	end

	def destroy
		if current_user.admin?
			Task.find(params[:id]).destroy
			flash[:success] = "Tarefa deletada!"
		else
			flash[:danger] = "Não tem permissão!"
		end
		redirect_to tasks_url
	end

	def show
	    @task = Task.find(params[:id])

	    if current_user.admin?
	    	@reply = @task.replies.all
	    else
	    	@reply = [@task.replies.find_by(user_id: current_user.id)]
	    end
	end

	def edit
		if current_user.admin?
			@task = Task.find(params[:id])
		else
			flash[:danger] = "Não tem permissão!"
			redirect_to tasks_url
		end
	end

	def update
		if current_user.admin?
			@task = Task.find(params[:id])
			
			if @task.update_attributes(task_params)
				flash[:success] = "Tarefa atualizada!"
				redirect_to @task
			else
				render 'edit'
			end
		else
			flash[:danger] = "Não tem permissão!"
			redirect_to tasks_url
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :text)
	end
end