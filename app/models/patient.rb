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
end
