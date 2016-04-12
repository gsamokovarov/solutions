class Problem < ApplicationRecord
  belongs_to :task
  belongs_to :user

  has_many :solutions

  delegate :name, :description, to: :task

  def solved?
    current_solution&.correct?
  end

  def current_solution
    solutions.last
  end
end
