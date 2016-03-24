class Solution < ApplicationRecord
  belongs_to :problem
  has_one :task, through: :problem

  validates :checked_at, presence: true
  validates :content, presence: true
  validates :test_status, presence: true
  validates :test_output, presence: true

  def correct?
    test_status.zero?
  end
end
