class UsersController < ApplicationController

  before_action :require_user, except: ['new', 'create', 'newadmin']

  def new
    @page_title = "Register"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit Account"
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      if @user != current_user
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end

  def index
    @page_title = "Users Index"
    @users = User.paginate(:page => params[:page], :per_page => 20)
    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @users
      }
    end
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def dashboard
    @user = current_user
    @page_title = "Dashboard"
    @patients = @user.patients.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @page_title = @user.name
      @doctorlists = @user.doctorlists
    else
      redirect_to "/"
    end

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @user
      }
    end
  end

  def newadmin
    @page_title = "Register Admin"
    @user = User.new
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password)
  end
end
