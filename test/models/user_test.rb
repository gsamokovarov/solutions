require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "cannot save user without password or email" do
    user = User.new

    assert_not user.save
  end

  test "can save user with password and email" do
    user = User.new(password: 'test1234', email: 'something')

    assert user.save
  end

  test "current problems for a user are those with end_at after today" do
    user = users(:example_with_problems)

    assert_equal 2, user.current_problems.count
  end

  test "current problems are always less then all the problems" do
    user = users(:example_with_problems)

    assert user.problems.count >= user.current_problems.count
  end

  test "current problems are empty if user has no problems" do
    user = users(:example_without_problems)

    assert user.current_problems.empty?
  end

  test "validates user email uniqueness" do
    user = users(:example)
    user.save

    user2 = User.new(email: user.email)
    assert_not user2.save
  end
end
