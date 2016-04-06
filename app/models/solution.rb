class Solution < ApplicationRecord
  belongs_to :problem
  has_one :task, through: :problem

  validates :content, presence: true

  with_options allow_nil: true do
    validates :checked_at, presence: true
    validates :test_status, presence: true
  end

  def correct?
    test_status&.zero?
  end

  def check
    Dir.mktmpdir do |dir|
      File.write("#{dir}/solution_test.rb", task.test)
      File.write("#{dir}/solution.rb", content)

      Dir.chdir(dir) do
        output = `#{task.test_command} 2>&1`
        status = $?.exitstatus

        update!(test_output: output, test_status: status, checked_at: Time.current)
      end
    end
  end
end
