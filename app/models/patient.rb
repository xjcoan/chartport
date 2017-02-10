class Patient < ApplicationRecord
  attr_encrypted_options.merge!(:encode => true)

  attr_encrypted :name, key: Rails.application.secrets.encr_key
  attr_encrypted :date_of_birth, key: Rails.application.secrets.encr_key
  attr_encrypted :phone_number, key: Rails.application.secrets.encr_key

  belongs_to :user
  has_many :medications
  has_many :patient_notes

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true

  self.per_page = 10

  def self.search(search)
    where("name ILIKE ?", "%#{search}%").all
  end

  def transfer(user)
    self.update(:user_id => user.id)
  end

  def find_age
    dob_year = self.date_of_birth.to_date
    now = Time.now.utc.to_date
    now.year - dob_year.year - ((now.month > dob_year.month || (now.month == dob_year.month && now.day >= self.dob_year.day)) ? 0 : 1)
  end
end
