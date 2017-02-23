class Patient < ApplicationRecord
  attr_encrypted_options.merge!(:encode => true)

  # Encrypt data
  attr_encrypted :name, key: Rails.application.secrets.encr_key
  attr_encrypted :date_of_birth, key: Rails.application.secrets.encr_key
  attr_encrypted :phone_number, key: Rails.application.secrets.encr_key

  belongs_to :user
  has_many :medications
  has_many :patient_notes

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true

  # Search function on index
  def self.search(search)
    where("name ILIKE ?", "%#{search}%").all
  end

  # transfer active user/doctor to new user
  def transfer(user)
    self.update(:user_id => user.id)
  end

  # Find age (for show and hovertip)
  def find_age
    dob = self.date_of_birth.to_date
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
