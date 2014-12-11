class UsersController < ApplicationController
	include SessionsHelper
	
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action 	:admin_user,     only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
	    @user = User.find(params[:id])
	  end

	def new
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      flash[:info] = "Cadastrado com sucesso!"
	      redirect_to root_url
	    else
	      render 'new'
	    end
	  end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "Usuário deletado"
		redirect_to users_url
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Perfil atualizado"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end