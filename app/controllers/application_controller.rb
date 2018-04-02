class ApplicationController < ActionController::Base
#  protect_from_forgery with: :exception

  before_action :check_session
  helper_method :current_user

  def check_session
  	redirect_to login_path unless current_user
  end
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
