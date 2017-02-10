class Medication < ApplicationRecord
  attr_encrypted_options.merge!(:encode => true)

  attr_encrypted :name, key: Rails.application.secrets.encr_key
  attr_encrypted :dosage, key: Rails.application.secrets.encr_key
  attr_encrypted :refills, key: Rails.application.secrets.encr_key


  belongs_to :patient

  validates :name, presence: true
  validates :dosage, presence: true
  validates :refills, presence: true
end
