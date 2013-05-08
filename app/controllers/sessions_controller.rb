class SessionsController < ApplicationController
  def new
  end

  def create
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to user_url(user)
  	else
  		flash.now.alert = "Email or password is invalid"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end

  protected
  def user
    user = User.find_by email: (params[:email])
  end
end
