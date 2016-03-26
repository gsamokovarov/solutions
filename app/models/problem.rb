class Problem < ApplicationRecord
  belongs_to :task
  belongs_to :user

  has_many :solutions

  delegate :name, :description, to: :task

  def solved?
    solutions.last&.correct?
  end

  def current_solution
    solutions.last
  end
end
