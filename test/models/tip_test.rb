require 'test_helper'

class TipTest < ActiveSupport::TestCase
  def setup 
    @user = users(:test_user_michael)
    @lesson_topic = lesson_topics(:test_lesson_topic1)
    @tip = @user.tips.build(
      name: "test tip 1", 
      description: "Test 1 Description", 
      user_outcome: "Really helped to get down X",
      resource_link: "www.somethinghelpful.com", 
      lesson_topic_id:  @lesson_topic.id)

  end 

  test 'should be valid' do 
    assert @tip.valid?
  end 

  test 'User ID should be present' do 
     @tip.user_id = nil 
     assert_not @tip.valid?
  end 

  test 'lesson topic id should be present' do 
    @tip.lesson_topic_id = nil 
    assert_not @tip.valid?
  end 

  test 'name should be present' do 
    @tip.name = nil 
    assert_not @tip.valid?
  end 

  test 'desciption should be present' do 
    @tip.description = nil 
    assert_not @tip.valid?
  end 

  test 'resource link should be present' do 
    @tip.resource_link = nil 
    assert_not @tip.valid?
  end 

  test 'tips should appear in descending order based on creation' do
     assert_equal tips(:most_recent), Tip.first 
  end 
   

end
