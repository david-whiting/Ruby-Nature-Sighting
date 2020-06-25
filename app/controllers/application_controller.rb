class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

  def authentication_required
    if !logged_in?
      flash[:danger] = "You must be logged in to access the app"
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
    #session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Explicitly tell ActionView to use a helper method in a view
  helper_method :current_user

end

