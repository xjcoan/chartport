class SessionsController < ApplicationController

  def new
    @page_title = 'Log In'
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      if params[:session][:persist] == '1'
        # Generate auth token for user account if no token present
        if @user.auth_token.nil?
          @user.auth_token = SecureRandom.urlsafe_base64
          # Allows account to be updated w/o validating fields from user.rb model
          @user.save(validate: false)
        end
        cookies.permanent[:chartport_auth_token] = @user.auth_token
      end
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to autherror_path
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:chartport_auth_token)
    redirect_to '/'
  end
end
