require 'test_helper'

class SolutionRunnerJobTest < ActiveJob::TestCase
  setup do
    @original_mktmpdir = Dir.method(:mktmpdir)
    @original_chdir = Dir.method(:chdir)
    @original_write = File.method(:write)
    @original_backtick = Kernel.instance_method('`')
  end

  teardown do
    Dir.define_singleton_method(:mktmpdir, @original_mktmpdir)
    Dir.define_singleton_method(:chdir, @original_chdir)
    File.define_singleton_method(:write, @original_write)
    Kernel.send(:define_method, '`', @original_backtick)
  end

  test 'checks submitted solutions' do
    Dir.class_eval <<~RUBY
      def self.mktmpdir
        yield '/tmp/tmpdir1'
      end
    RUBY

    calls = 0
    File.define_singleton_method(:write) do |path, content|
      calls += 1

      case calls
      when 1
        raise if path != '/tmp/tmpdir1/solution_test.rb'
        raise if content != 'assert false'
      when 2
        raise if path != '/tmp/tmpdir1/solution.rb'
        raise if content != 'puts foo'
      end
    end

    Dir.class_eval <<~RUBY
      def self.chdir(path)
        raise if path != '/tmp/tmpdir1'
        yield
      end
    RUBY

    Kernel.send(:define_method, '`') do |command|
      raise if command != 'true'
      MockLastStatus.set(0)
      'foo'
    end

    solution = solutions(:test)
    SolutionRunnerJob.perform_now(solution)

    solution.reload

    assert_equal 'foo', solution.test_output
    assert_equal 0, solution.test_status
  end
end
