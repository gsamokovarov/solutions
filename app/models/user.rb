class User < ApplicationRecord
  has_secure_password

  has_many :problems

  validates :email, presence: true
end
