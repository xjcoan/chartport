class PatientsController < ApplicationController

  def new
    @page_title = "Add Patient Record"
    @patient = Patient.new
  end

  def create
    @patient = current_user.patients.new(patient_params)

    if @patient.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit Patient"
    if Patient.exists?(params[:id])
      @patient = Patient.find(params[:id])
    end
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @page_title = @patient.name + " record"

    respond_to do | f |
      f.html {
        # do stuff to populate your html view
        # maybe nothing at all because @source is set
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @patients
      }
    end
  end

  def index
    @page_title = "Patients Index"
    @patients = current_user.patients.all.paginate(:page => 1, :per_page => 10)
    if params[:search]
      @patients = current_user.patients.search(params[:search]).order("created_at DESC").paginate(:page => params[:page])
    else
      @patients = current_user.patients.all.order("created_at DESC")
    end

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @patients
      }
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to dashboard_path
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :date_of_birth, :phone_number, :medical_history, :medication, :user_id)
  end

end
