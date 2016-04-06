class CheckSolutionJob < ApplicationJob
  def perform(solution)
    solution.check
  end
end
