json.array! @patients do |patient|
  json.patient do
    json.patient_name patient.name
    json.date_of_birth patient.date_of_birth
    json.phone patient.phone_number
    json.medical_history patient.medical_history
    json.medication patient.medication
    json.hospital User.find(patient.user_id).name
  end
end
