class UsersController < ApplicationController
	before_filter :find_user, only: [:show, :edit, :update, :destroy]

	def show
	end

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user, notice: "User updated"
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		redirect_to users_path, notice: "User destroyed!"
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, 
																		:first_name, :surname)
		end

		def find_user
			@user = User.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				redirect_to users_url, alert: "User not found"
		end
end
