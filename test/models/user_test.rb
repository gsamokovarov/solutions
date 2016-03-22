require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "cannot save user without password or email" do
    user = User.new

    assert_not user.save
  end

  test "can save user with password and email" do
    user = User.new(password: 'test1234',
                    email: 'something')

    assert user.save
  end
end
