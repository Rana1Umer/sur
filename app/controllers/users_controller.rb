class UsersController < ApplicationController
	before_action :authorize_admin
	
	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		
		redirect_to users_path
	end

	private

	def authorize_admin
		redirect_to root_path, alert: 'Access Denied' unless current_user.role=="admin"
		
		if current_user.role == "visitor"
			return
		end
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
	end
end
