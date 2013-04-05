class MissivesController < ApplicationController
	before_filter :find_missive, only: [:show, :edit, :update, :destroy]

	def show; end

	def new
		@missive = Missive.new
	end

	def create
		@missive = Missive.new(missive_params)
		if @missive.save
			redirect_to @missive, notice: "Missive created!"
		else
			render action: :new, alert: "Creation failed!"
		end
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
