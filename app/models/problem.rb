class Problem < ApplicationRecord
  belongs_to :task
  belongs_to :user

  has_many :solutions

  def solved?
    solutions.last&.correct?
  end
end
