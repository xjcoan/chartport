class User < ApplicationRecord
  # bcrypt gem
  has_secure_password
  has_secure_token :auth_token
  attr_encrypted_options[encode: true]
  # Encrypt data
  attr_encrypted :name, key: Rails.application.secrets.encr_key

  has_many :patients
  has_many :doctorlists
  has_many :hospitals, through: :doctorlists

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
