class Patient < ApplicationRecord
  belongs_to :user

  def self.search(search)
    where("name ILIKE ?", "%#{search}%").all
  end
end
