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

problem = Problem.find_or_create_by!(user: user, task: task, ends_at: Date.yesterday)

Solution.find_or_create_by!(problem: problem) do |solution|
  solution.content = <<~RUBY
    def odd?(number)
      false
    end
  RUBY
  solution.test_status = 0
end

admin = User.find_or_create_by!(email: 'admin@example.org') do |admin|
  admin.password = 'admin1234'
  admin.is_admin = true
end

task1 = Task.find_or_create_by!(name: "Word is palindrome") do |task|
  task.description = 'Words that are read the same backwards'
  task.test_command = 'ruby solution_test.rb'
  task.test = <<~RUBY
    require 'minitest/autorun'
    require_relative 'solution'

    class PalindromeTest < Minitest::Test
      def test_words_are_palindromes_when_they_are_like_racecar
        assert_equal true, palindrome?("racecar")
      end

      def test_words_are_palindromes_when_they_are_like_race
        assert_equal false, palindrome?("race")
      end
    end
  RUBY
end

problem1 = Problem.find_or_create_by!(user: user, task: task1, ends_at: 100.years.from_now)

Solution.find_or_create_by!(problem: problem1) do |solution|
  solution.content = <<~RUBY
    def palindrome?(word)
      false
    end
  RUBY
end
