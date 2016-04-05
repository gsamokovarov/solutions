class SolutionRunnerJob < ApplicationJob
  def perform(solution)
    Dir.mktmpdir do |dir|
      File.write("#{dir}/solution_test.rb", solution.task.test)
      File.write("#{dir}/solution.rb", solution.content)

      Dir.chdir(dir) do
        output = `#{solution.task.test_command} 2>&1`
        status = $?.exitstatus

        solution.update!(test_output: output, test_status: status)
      end
    end
  end
end
