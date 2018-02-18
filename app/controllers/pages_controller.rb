class PagesController < ApplicationController

  def index
    # Sign in user if auth token found
    if cookies[:chartport_auth_token]
      user = User.find_by_auth_token(cookies[:chartport_auth_token])
      session[:user_id] = user.id if user
    end
    @page_title = 'Home'
    redirect_to dashboard_path if current_user

    respond_to do |format|
      format.html
    end
  end

  def errorpage
    @page_title = 'Error page'
  end

  def auth_error
    @page_title = 'Error Signing In'
  end
end
