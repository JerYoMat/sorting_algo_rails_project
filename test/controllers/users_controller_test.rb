require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
   @user10 = users(:test_user_michael)
   @user20 = users(:test_user_angelo)
  end 
  
  
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "ensure that the wrong user is redirected when trying to navigate to edit" do 
    log_in_as(@user20)
    get edit_user_path(@user10)
    assert flash.empty?
    assert_redirected_to root_url
  end 

end
