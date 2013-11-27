class SessionsController < ApplicationController
  def new
  end

  def create
  	user=User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id]=user.id 

  		flash[:notice] = "Success"
  		redirect_to events_path
  		#going to be user show with list of shwos attended, shows want to attend and shows reviewd, with points
  	else
  		debugger
  		flash[:notice] = "failure"
  		redirect_to events_path
  	end
  end

  def destroy
  	session[:user_id]=nil
  	redirect_to events_path
  end
end
