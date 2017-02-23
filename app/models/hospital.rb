class Hospital < ApplicationRecord
  attr_encrypted_options.merge!(:encode => true)

  # Encrypt data
  attr_encrypted :name, key: Rails.application.secrets.encr_key
  attr_encrypted :street_address, key: Rails.application.secrets.encr_key
  attr_encrypted :city, key: Rails.application.secrets.encr_key
  attr_encrypted :state, key: Rails.application.secrets.encr_key
  attr_encrypted :zipcode, key: Rails.application.secrets.encr_key


  has_many :doctorlists
  has_many :users, :through => :doctorlists

  # Getter methods. Use to decrypt data for google maps
  def get_street
    self.street_address
  end

  def get_city
    self.city
  end

  def get_state
    self.state
  end

  def get_zipcode
    self.zipcode
  end
end
