class ApplicationController < ActionController::Base
  # helper_method makes the methods available on the views
  helper_method :current_user, :logged_in?

  def current_user
    # if @current_user is set, return  @current_user
    # if not, query the database, fetch the user, assign it to @current_user and return that value
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !! turns into a boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
