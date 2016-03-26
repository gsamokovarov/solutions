class Solution < ApplicationRecord
  belongs_to :problem
  has_one :task, through: :problem

  validates :content, presence: true

  with_options allow_nil: true do
    validates :checked_at, presence: true
    validates :test_status, presence: true
    validates :test_output, presence: true
  end

  def correct?
    test_status.zero?
  end
end
