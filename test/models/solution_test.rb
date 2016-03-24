require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  test "solution is correct when test_status is zero" do
    solution = Solution.new(test_status: 0)

    assert_equal true, solution.correct?
  end

  test "solution is not correct when test_status is non-zero" do
    solution = Solution.new(test_status: 123)

    assert_equal false, solution.correct?
  end
end
