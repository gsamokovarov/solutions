class User < ApplicationRecord
  has_secure_password

  has_many :problems

  validates :email, presence: true, uniqueness: true

  def current_problems
    problems.where('ends_at >= ?', Date.today)
  end

  def unsolved_problems
    current_problems.reject(&:solved?)
  end

  def solved_problems
    problems.select(&:solved?)
  end
end
