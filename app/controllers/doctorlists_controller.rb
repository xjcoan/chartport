class DoctorlistsController < ApplicationController
  before_action :require_user

  def new
    @page_title = "Register To Hospital"
    @doctorlist = Doctorlist.new
    @user = current_user
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    @page_title = "Register To Hospital"
    @doctorlist = Doctorlist.new(doctorlist_params)

    if @doctorlist.save
      redirect_to hospital_path(Hospital.find(@doctorlist.hospital_id))
    else
      render 'new'
    end
  end

  def index
    @context = params[:context]
    if @context == "user"
      @user = User.find(params[:given_id])
      @page_title = "#{@user.name} Hospital Registrations"
      @doctorlists = @user.doctorlists.all
    elsif @context == "hospital"
      @page_title = "Registered Doctors"
      @hospital = Hospital.find(params[:given_id])
      @doctorlists = @hospital.doctorlists.all
    elsif @context == "admin"
      if !current_user.admin
        redirect_to root_path
      end
      @page_title = "Hospital Registrations"
      @doctorlists = Doctorlist.all
    end
  end

  def destroy
    @doctorlist = Doctorlist.find(params[:id])
    @doctorlist.destroy

    redirect_to dashboard_path
  end

  private

  def doctorlist_params
    params.require(:doctorlist).permit(:hospital_id, :user_id)
  end
end
