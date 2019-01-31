require 'test_helper'

class TipsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @tip = tips(:test_tip1)
  end 

  test 'should redirect create when not logged in' do 
    assert_no_difference 'Tip.count' do
      post tips_path, params: { tip: { 
        name: "Test Name",
        lesson_topic_id: 1,
        user_id: 1,    
        description: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end 
end
