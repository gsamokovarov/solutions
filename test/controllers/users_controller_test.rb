require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "creating new users" do
    get '/users/new'
    assert_equal 200, status

    user_params = {
      user: {
        email: 'test@example.com',
        password: 'test1234'
      }
    }
    post '/users', params: user_params

    follow_redirect!

    assert_equal 200, status
    assert flash[:notice].present?
    assert_select 'h2'
  end
end
