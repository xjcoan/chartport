class User < ApplicationRecord
  has_secure_password
  attr_encrypted_options.merge!(:encode => true)

  attr_encrypted :name, key: Rails.application.secrets.encr_key

  has_many :patients
  has_many :doctorlists
  has_many :hospitals, :through => :doctorlists

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
