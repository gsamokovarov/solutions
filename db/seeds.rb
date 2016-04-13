# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!(email: 'to@example.org') do |user|
  user.password = 'test1234'
end

task = Task.find_or_create_by!(name: "Numbers are odd") do |task|
  task.description = 'Because the other numbers lough at them...'
  task.test_command = 'ruby solution_test.rb'
  task.test = <<~RUBY
    require 'minitest/autorun'
    require_relative 'solution'

    class OddTest < Minitest::Test
      def test_numbers_are_odd_when_they_are_like_3
        assert_equal true, odd?(3)
      end

      def test_numbers_arent_odd_when_they_are_like_2
        assert_equal false, odd?(2)
      end
    end
  RUBY
end

prime_task = Task.find_or_create_by!(name: "Numbers are prime") do |task|
  task.description = 'We need to find prime numbers!'
  task.test_command = 'ruby solution_test.rb'
  task.test = <<~RUBY
  require 'minitest/autorun'
  require_relative 'solution'

  class PrimeTest < Minitest::Test
    def test_numbers_are_prime_like_4_2_17_97_113_1223
      primes = [3, 2, 17, 97, 113, 1223]
      
      primes.each do |number|
        assert_equel true, prime?(number)
      end
    end

    def test_numbers_arent_prime_like_16_100_-100_0_1
      non_primes = [16, 100, -100, 0, 1, 10000000]

      non_primes.each do |number|
        assert_equal false, prime?(number)
      end
    end
  end
  RUBY
end

problem = Problem.find_or_create_by!(user: user, task: task, ends_at: 100.years.from_now)
prime_problem = Problem.find_or_create_by!(user: user, task: prime_task, ends_at: 100.years.from_now)

Solution.find_or_create_by!(problem: problem) do |solution|
  solution.content = <<~RUBY
    def odd?(number)
      false
    end
  RUBY
end
