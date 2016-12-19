class Medication < ApplicationRecord
  belongs_to :patient

  validates :name, presence: true
  validates :dosage, presence: true
  validates :refills, presence: true
end
