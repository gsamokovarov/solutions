require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  test "isn't correct with no solutions" do
    problem = Problem.new

    assert_not problem.solved?
  end

  test "isn't correct with an incorrect solution" do
    problem = Problem.create!(task_id: task.id, user_id: user.id, ends_at: Date.tomorrow)
    problem.solutions.new(test_status: 123)

    assert_not problem.solved?
  end

  test "is correct if the last solution is correct" do
    problem = Problem.create!(task_id: task.id, user_id: user.id, ends_at: Date.tomorrow)
    problem.solutions.new(test_status: 123)
    problem.solutions.new(test_status: 0)

    assert problem.solved?
  end

  private

  def user
    User.create!(email: 'test@example.com', password: 'test1234')
  end

  def task
    Task.create!(name: 'test', description: 'test', test: 'assert false', test_command: 'true')
  end
end
