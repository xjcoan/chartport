class PatientNotesController < ApplicationController
  before_filter :require_user

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
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  private

  def patient_note_params
    params.require(:patient_note).permit(:note, :user_id, :patient_id)
  end
end
