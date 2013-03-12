module ApplicationHelper
  def welcome_message
    # must be logging in
    return if controller.controller_name == 'users' || controller.controller_name == 'sessions'
    # is this user signed in?
    return link_to "Logged in as #{@user.name.capitalize}" if user_signed_in?
    # nope just visiting
    message = @user.signed_up? ? "Welcome back, #{@user.name.capitalize}" : "Welcome #{@user.name}"
    link_to message
  end
end
