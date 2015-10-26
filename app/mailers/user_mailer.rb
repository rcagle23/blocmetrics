class UserMailer < ApplicationMailer
  default from: 'randi.cagle@gmail.com'
  
  def signup_confirmation(user)
    @user = user
    @url  = 'https://blocmetrics-rcagle23.c9.io/login'
    mail(to: @user.email, subject: 'Welcome to Blocmetrics')
  end
  
  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: "Password Reset")
  end
end
