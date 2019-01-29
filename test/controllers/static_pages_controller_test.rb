require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  #Added by generating the controller and makes sure that a 200 status code is returned when the home url is visited
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

end
