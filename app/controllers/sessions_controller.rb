class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]
  
  def new
  end
  
  # handles authentications when a user submits login form
  def create
    user = User.authenticate(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to root_url
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end
  
  # removes logged user.id from session
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end
end
