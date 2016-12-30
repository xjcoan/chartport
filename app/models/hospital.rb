class Hospital < ApplicationRecord
  has_many :doctorlists
  has_many :users, :through => :doctorlists
end
