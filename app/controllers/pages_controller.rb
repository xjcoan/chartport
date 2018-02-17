class PagesController < ApplicationController

  def index
    # Sign in user if auth token found
    if cookies[:chartport_auth_token]
      @user = User.find_by_auth_token(cookies[:chartport_auth_token])
      session[:user_id] = @user.id
    end
    @page_title = "Home"
    if current_user
      redirect_to dashboard_path
    end

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
