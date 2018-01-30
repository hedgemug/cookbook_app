class User < ApplicationRecord
  has_secure_password

  has_many :recipes

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
