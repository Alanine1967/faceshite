class MissivesController < ApplicationController
	before_filter :find_missive, only: [:show, :edit, :update, :destroy]
	before_filter :authorize, only: [:edit, :update]

	def show
	end

	def index
		@missives = current_user.missives
	end

	def new
		@missive = current_user.missives.new
	end

	def create
		@missive = current_user.missives.new(missive_params)
		if @missive.save
			redirect_to current_user, notice: "Missive created!"
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @missive.update(missive_params)
			redirect_to @missive, notice: "Successfully updated!"
		else
			render "edit"
		end
	end

	def destroy
		@missive.destroy
		redirect_to user_missives_url(current_user), notice: "Missive deleted!"
	end

	private
		def missive_params
			params.require(:missive).permit(:title, :content)
		end

		def find_missive
			@missive = current_user.missives.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				redirect_to user_missives_url(current_user), alert: "Missive not found"
		end
end
