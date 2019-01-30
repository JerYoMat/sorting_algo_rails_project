require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do 
    get login_path 
    assert_select 'title', 'Log in'
    assert_response :success
  end 

end
