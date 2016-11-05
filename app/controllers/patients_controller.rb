class PatientsController < ApplicationController

  def new
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
  end

  def index
    @patients = Patient.all
    if params[:search]
      @patients = Patient.search(params[:search]).order("created_at DESC")
    else
      @patients = Patient.all.order("created_at DESC")
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
