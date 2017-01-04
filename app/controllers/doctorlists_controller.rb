class DoctorlistsController < ApplicationController
  before_filter :require_user

  def new
    @page_title = "Register To Hospital"
    @doctorlist = Doctorlist.new
    @user = current_user
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    @doctorlist = Doctorlist.new(doctorlist_params)

    if @doctorlist.save
      redirect_to hospital_path(Hospital.find(@doctorlist.hospital_id))
    else
      render 'new'
    end
  end

  def index
    @doctorlists = Doctorlists.all.paginate(:page => 1, :per_page => 10)
    @page_title = "Hospital Registrations'"
  end

  def userindex
    @doctorlists = current_user.doctorlists.all.paginate(:page => 1, :per_page => 10)
    @page_title = "Your Hospital Registrations'"
  end

  def hospitalindex
    @hospital = Hospital.find(params[:hospital_id])
    @page_title = "Registered Doctors"
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
