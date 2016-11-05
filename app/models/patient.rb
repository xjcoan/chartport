class Patient < ApplicationRecord
  belongs_to :user

  self.per_page = 10

  def self.search(search)
    where("name ILIKE ?", "%#{search}%").all
  end
end
