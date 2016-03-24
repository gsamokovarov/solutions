require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  test "isn't correct with no solutions" do
    problem = Problem.new

    assert_not problem.solved?
  end

  test "isn't correct with an incorrect solution" do
    problem = problems(:test)
    problem.solutions.new(test_status: 123)

    assert_not problem.solved?
  end

  test "is correct if the last solution is correct" do
    problem = problems(:test)
    problem.solutions.new(test_status: 123)
    problem.solutions.new(test_status: 0)

    assert problem.solved?
  end
end
