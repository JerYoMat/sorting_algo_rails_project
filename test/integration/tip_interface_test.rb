require 'test_helper'

class TipInterfaceTest < ActionDispatch::IntegrationTest
  def setup 
   @user1 = users(:test_user_michael)
   @user2 = users(:test_user_angelo)  
  end 

  test 'tip interface' do 
    log_in_as(@user1)
    get root_path 
    assert_template 'static_pages/home'
    get new_tip_path 
    #Invalid submission 
    assert_no_difference "Tip.count" do 
      post tips_path, params: { tip: {name: '',
                                      description: '',
                                      resource_link: '',
                                      user_id: '',
                                      lesson_topic_id: 1}}
      end 
     assert_select 'div#error_explanation'
  end 

end


#Log in 
#make invalid submission 
#make valid submission 
#delete tip 
#visit user page of non-logged in user and check for delete link
