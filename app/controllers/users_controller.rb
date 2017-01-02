class UsersController < ApplicationController

  before_filter :require_user, except: ['new', 'create', 'newadmin']

  def new
    @page_title = "Register"
    @user = User.new
    @user.admin = false
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
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
    @users = User.all.paginate(:page => 1, :per_page => 10)
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
    require_user
    @patients = @user.patients.all.paginate(:page => params[:page])
  end


  def exportjson
    @user = User.find(params[:id])
    @patients = @user.patients.all

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @user.patients.all
      }
    end
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @page_title = @user.name
    else
      redirect_to "/"
    end
  end

  def newadmin
    @page_title = "Register Admin"
    @user = User.new
    @user.admin = true
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password)
  end
end
