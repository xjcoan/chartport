class Doctorlist < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
end
