class UsersController < ApplicationController
	before_filter :find_user, only: [:show, :edit, :update, :destroy]

	def show
		@acquaintances = @user.acquaintances
		@user.inverse_acquaintances.each { |user| @acquaintances << user }
	end

	def index
		@strangers = []
		strangers.each { |stranger| @strangers << stranger unless known?(stranger) }
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user, notice: "Thank you for signing up!"
		else
			render 'static_pages/home'
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
		redirect_to users_url, notice: "User destroyed!"
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

		def strangers
			User.where.not(id: current_user)
		end

		def known?(user)
			current_user.acquaintances.include?(user)
		end
end
