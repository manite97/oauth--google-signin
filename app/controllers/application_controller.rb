class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :current_user 
  def current_user
    
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    elsif params["controller"] == "home"
      @current_user = nil
    else
      redirect_to login_path, alert: "Please Login to enter into the store"
    end
  end
end
