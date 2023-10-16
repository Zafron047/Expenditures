class ApplicationController < ActionController::Base
  # current_user = User.find_by(id: session[:user_id])
  helper_method :current_user

  def current_user
    @current_user ||= User.first
  end
  
end
