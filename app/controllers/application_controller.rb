class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_signed_in?

  before_filter :user_setup

  def user_setup
    @user = User.where(id:session[:uid]).first if session[:uid]

    unless @user
      # we dont have a userid in the sess, try to load from cookie
      if cookies.signed[:uid]
        @user = User.where(id:cookies.signed[:uid]).first
      end

      # cookie uid may be bad
      unless @user
        @user = User.create_anonymous
        cookies.signed[:uid] = @user.id
      end
    end

    logger.info "Current user:[#{@user.id}] connected"
  end

  def user_signed_in?
    logger.info "user_signed_in? #{session[:uid]}"
    !session[:uid].nil?
  end

end
