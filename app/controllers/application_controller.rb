class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  helper_method :current_user, :logged_in?
  before_filter :require_login
  
  private
  def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
  end
  
  def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
  end
  
  def require_login
      unless current_user
          redirect_to login_url
          return false
      end
  end
  
  def logged_in?
      current_user_session != nil
  end
  
end
