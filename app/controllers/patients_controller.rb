class PatientsController < ApplicationController
  before_action :require_user

  def new
    @page_title = "Add Patient Record"
    @patient = Patient.new
    @user = current_user
  end

  def create
    @patient = current_user.patients.new(patient_params)

    if @patient.save
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit Patient"
    if Patient.exists?(params[:id])
      @patient = Patient.find(params[:id])
      if @patient.user_id != current_user.id
        redirect_to patient_path(@patient)
      end
    end
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @page_title = @patient.name + " record"
    @patient_notes = @patient.patient_notes.paginate(:page => params[:page], :per_page => 15)
    @medications = @patient.medications.paginate(:page => params[:page], :per_page => 10)

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @patient
      }
    end
  end

  def index
    @page_title = "Patients Index"
    @patients = current_user.patients.paginate(:page => params[:page], :per_page => 10)
    if params[:search]
      @patients = current_user.patients.where(id: params[:search]).paginate(:page => params[:page], :per_page => 30)
      if params[:search].blank?
        @patients = current_user.patients.order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
      end
    end

    respond_to do | f |
      f.html {
      }

      f.any(:xml, :json) {
        render request.format.to_sym => @patients
      }
    end
  end

  def adminindex
    @page_title = "Patients Index"
    @patients = Patient.paginate(:page => params[:page], :per_page => 30)
    if params[:search]
      @patients = Patient.where(id: params[:search]).paginate(:page => params[:page], :per_page => 30)
      if params[:search].blank?
        @patients = Patient.order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
      end
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

  def medicationindex
    @patient = Patient.find(params[:id])
    @medications = @patient.medications
  end

  def importsearch
    @page_title = "Patients Index"
    @patients = Patient.where.not(:user_id => current_user).paginate(:page => params[:page], :per_page => 30)
    if params[:search]
      @patients = Patient.where.not(:user_id => current_user).where(:id => params[:search]).order("created_at DESC")
    else
      @patients = Patient.where.not(:user_id => current_user).order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
    end
  end

  def importpatient
    @page_title = "Import Patient"
    @user = current_user
    @patient = Patient.find(params[:id])
    @patient.touch
    @patient.transfer(@user)
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :date_of_birth, :phone_number, :primary_care_physician, :user_id)
  end

end
