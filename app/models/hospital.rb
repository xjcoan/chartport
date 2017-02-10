class Hospital < ApplicationRecord
  attr_encrypted_options.merge!(:encode => true)

  attr_encrypted :name, key: Rails.application.secrets.encr_key
  attr_encrypted :street_address, key: Rails.application.secrets.encr_key
  attr_encrypted :city, key: Rails.application.secrets.encr_key
  attr_encrypted :state, key: Rails.application.secrets.encr_key
  attr_encrypted :zipcode, key: Rails.application.secrets.encr_key


  has_many :doctorlists
  has_many :users, :through => :doctorlists
end
