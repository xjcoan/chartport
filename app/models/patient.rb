class Patient < ApplicationRecord
  belongs_to :user
  has_many :medications

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true
  validates :medical_history, presence: true

  self.per_page = 10

  def self.search(search)
    where("name ILIKE ?", "%#{search}%").all
  end

  def transfer(user)
    self.update(:user_id => user.id)
  end

  def find_age
    now = Time.now.utc.to_date
    now.year - self.date_of_birth.year - ((now.month > self.date_of_birth.month || (now.month == self.date_of_birth.month && now.day >= self.date_of_birth.day)) ? 0 : 1)
  end
end
