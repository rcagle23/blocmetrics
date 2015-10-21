class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.signup_confirmation(@user).deliver_now
      flash[:notice] = "You've signed up successfully! Please look for a confirmation email shortly."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong, please try again."
      render :new
    end
  end
  
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:notice] = "Your email has been confirmed #{@user}! Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :salt, :encrypted_password)
  end
end
