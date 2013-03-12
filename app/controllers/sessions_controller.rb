class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      user.update_attribute(:last_sign_in_at, Time.now)
      cookies.signed[:uid] = session[:uid] = user.id
      redirect_to root_path
    elsif user
      flash.now[:error] = 'Incorrect email/password combination'
      render 'new'
    else
      flash.now[:error] = "No account found with that email. Maybe you haven't signing up yet?"
      render 'new'
    end
  end

  def destroy
    session[:uid] = nil
    redirect_to root_path
  end
end
