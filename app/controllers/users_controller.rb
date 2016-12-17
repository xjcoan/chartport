class UsersController < ApplicationController

  before_filter :require_user, except: ['new', 'create']


  def new
    @page_title = "Register"
    @user = User.new
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
        if (@current_user != @user)
          redirect_to '/'
        else
          redirect_to 'dashboard'
        end
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @user.patients.all
      }
    end
  end

  def exportpatient
    @patient = Patient.find(params[:id])


    respond_to do | f |
      f.html {
        if (@current_user != @user)
          redirect_to '/'
        else
          redirect_to 'dashboard'
        end
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @patient
      }
    end
  end

  def importpatient
    @user = current_user

    @patient = Patient.find(params[:id])

    @patient.update(:user_id => @user.id)
  end

  def importsearch
    @page_title = "Patients Index"
    @patients = Patient.where.not(:user_id => current_user)
    if params[:search]
      @patients = Patient.where.not(:user_id => current_user).search(params[:search]).order("created_at DESC").paginate(:page => params[:page])
    else
      @patients = Patient.where.not(:user_id => current_user).order("created_at DESC")
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


  private

  def user_params
    params.require(:user).permit(:name, :email, :street_address, :city, :state, :zipcode, :password)
  end
end
