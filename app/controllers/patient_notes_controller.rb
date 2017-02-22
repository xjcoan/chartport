class PatientNotesController < ApplicationController
  before_action :require_user

  def new
    @page_title = "New Patient Note"
    @user = current_user
    @patient = Patient.find(params[:patient_id])
    @patient_note = PatientNote.new
  end

  def create
    @page_title = "New Patient Note"
    @patient = Patient.find(params[:patient_id])
    @user = current_user
    @patient_note = @patient.patient_notes.new(patient_note_params)
    if @patient_note.save
      @patient.touch
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def edit
    @page_title = "Edit Note"
    if PatientNote.exists?(params[:id])
      @patient_note = PatientNote.find(params[:id])
      @patient = Patient.find(@patient_note.patient_id)
      @user = current_user
    end
  end

  def show
    @page_title = "Show Note"
    if PatientNote.exists?(params[:id])
      @patient_note = PatientNote.find(params[:id])
      @patient = Patient.find(@patient_note.patient_id)
      @user = User.find(@patient_note.user_id)
    end
  end

  def update
    @patient_note = PatientNote.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    if @patient_note.update(patient_note_params)
      @patient.touch
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def destroy
    @patient_note = PatientNote.find(params[:id])
    @patient = Patient.find(@patient_note.patient_id)
    @patient_note.destroy
    @patient.touch

    redirect_to patient_path(@patient)
  end

  private

  def patient_note_params
    params.require(:patient_note).permit(:note, :user_id, :patient_id)
  end
end
