class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    if User.any?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def require_user
    redirect_to '/login' unless current_user
  end

end
