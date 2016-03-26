class User < ApplicationRecord
  has_secure_password

  has_many :problems

  validates :email, presence: true

  def current_problems
    problems.where('ends_at >= ?', Date.today)
  end
end
