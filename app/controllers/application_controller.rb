class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_authorization
    unless @user == current_user || (User.find_by(id: params[:entry][:responder_id]) if params[:entry]) == current_user
      flash[:message] = "You do not have permission to view that page."
      redirect_to user_entries_path(current_user)
    end
  end

  def require_login
    unless logged_in?
      flash[:message] = "You must be logged in to view that page"
      redirect_to login_path 
    end
  end

end
