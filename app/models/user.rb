class User < ApplicationRecord
  has_secure_password

  has_many :patients
  has_many :doctorlists
  has_many :hospitals, :through => :doctorlists

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  #attr_encrypted :name, key: ENV['256_encrypt_key']
end
