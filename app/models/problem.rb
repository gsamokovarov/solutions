class Problem < ApplicationRecord
  belongs_to :task
  has_many :solutions

  def solved?
    solutions.last&.correct?
  end
end
