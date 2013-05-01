class RelationshipsController < ApplicationController

  def create
  	@relationship = current_user.relationships.build(acquaintance_id: params[:acquaintance_id])
  	if @relationship.save
  		redirect_to user_url(current_user), notice: "Acquaintance added"
  	else
  		render "static_pages/home"
  	end
  end

  def destroy
  end
end
