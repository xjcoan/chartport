class User < ApplicationRecord
  # bcrypt gem
  has_secure_password
  attr_encrypted_options.merge!(:encode => true)
  # Encrypt data
  attr_encrypted :name, key: Rails.application.secrets.encr_key

  has_many :patients
  has_many :doctorlists
  has_many :hospitals, :through => :doctorlists

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


  def self.get_name
    self.name
  end
end
