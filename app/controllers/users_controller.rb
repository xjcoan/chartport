class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def dashboard
    @user = current_user
    require_user
    @patients = Patient.all
    if params[:search]
      @satients = Patient.search(params[:search]).order("created_at DESC")
    else
      @patients = Patient.all.order("created_at DESC")
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
