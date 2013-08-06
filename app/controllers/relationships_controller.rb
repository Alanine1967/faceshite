class RelationshipsController < ApplicationController
	before_action :find_relationships

	def index
	end

  def create
  	relationship = @relationships.build(acquaintance_id: params[:acquaintance_id])
  	if relationship.save
  		redirect_to user_url(current_user)
  	else
  		render "static_pages/home"
  	end
  end

  def destroy
  	relationship = @relationships.find(params[:id])
  	relationship.destroy
  	redirect_to users_url, notice: "Acquaintance removed"
  end

  private
  	def find_relationships
  		@relationships ||= current_user.relationships
  	end
end
