class SolutionRunnerJob < ApplicationJob
  def perform(solution)
    solution.check
  end
end
