class MissivesController < ApplicationController
	before_filter :find_missive, only: [:show, :edit, :update, :destroy]
	before_filter :authorize, only: [:edit, :update]

	def show
	end

	def index
		@missives = Missive.all
	end

	def new
		@missive = Missive.new
	end

	def create
		@missive = Missive.new(missive_params)
		if @missive.save
			redirect_to @missive, notice: "Missive created!"
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
		redirect_to missives_path, notice: "Missive deleted!"
	end

	private
		def missive_params
			params.require(:missive).permit(:title, :content)
		end

		def find_missive
			@missive = Missive.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				redirect_to missives_url, alert: "Missive not found"
		end
end
