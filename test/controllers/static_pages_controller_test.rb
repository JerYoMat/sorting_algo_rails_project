require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  #Added by generating the controller and makes sure that a 200 status code is returned when the home url is visited
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home" #assert_select tests for the presence of a specific html tag
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About"
  end

end
