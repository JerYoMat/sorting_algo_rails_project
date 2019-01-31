require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:test_user_michael)
  end 
  #Added by generating the controller and makes sure that a 200 status code is returned when the home url is visited
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About"
  end

  test "should display user show on home if logged in" do 
    log_in_as(@user)
    get root_path 
    assert_select('h1').first["#{@user.name}"]
  end 

  test "should display welcom page if not logged in" do 
    get root_path 
    assert_select "h1", "Welcome to LearnHELP"
  end 


end
