class TasksController < ApplicationController
	def index
		@tasks = Task.paginate(page: params[:page])
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
	    if @task.save
	      flash[:info] = "Cadastrado com sucesso!"
	      redirect_to root_url
	    else
	      render 'index'
	    end
	end

	def destroy
		Task.find(params[:id]).destroy
		flash[:success] = "Tarefa deletada"
		redirect_to tasks_url
	end

	def show
	    @task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		
		if @task.update_attributes(task_params)
			flash[:success] = "Tarefa atualizada"
			redirect_to @task
		else
			render 'edit'
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :text)
	end
end