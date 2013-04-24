class RelationshipController < ApplicationController
  def create
  	@relationship = current_user.relationships.build(acquaintance_id: params[:acquaintance_id])
  	if @relationship.save
  		redirect_to user_url(current_user), notice: "Friend added"
  	else
  		redirect_to root_url, notice: "Unable to add friend"
  	end
  end

  def destroy
  end
end
