class UsersController < ApplicationController
  def new
    # only use the user if they've not signed up
    if @user.signed_up?
      @already_signed_up = true
      @user = User.new
    else
      @user.name = nil
    end
  end

  def create
    @user = User.new(params[:user])
    @user.signed_up = true
    @user.last_sign_in_at = Time.now

    if @user.save
      cookies.signed[:uid] = session[:uid] = @user.id
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def update
    if @user.update_attributes(params[:user].merge(signed_up:true, last_sign_in_at:Time.now))
      cookies.signed[:uid] = session[:uid] = @user.id
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

end
