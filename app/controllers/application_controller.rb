class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :user_signed_in?, :login_path

  private
  
  def login_path
    "/auth/google"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_signed_in?
    !current_user.nil?
  end
  
  def authenticate_user!
    redirect_to root_url, :alert => "You must be signed in to do that" unless user_signed_in?
  end
end
