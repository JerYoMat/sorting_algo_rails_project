require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test_user_michael) 
  end 

  test "logged in user can see index" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.users'
    assert_not_empty 'ul.users li', count: 0
  end 
end
