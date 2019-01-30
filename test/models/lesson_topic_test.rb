require 'test_helper'

class LessonTopicTest < ActiveSupport::TestCase
  def setup 
    @tip = tips(:test_tip1)
    @lesson_topic = LessonTopic.new(
          name: "second lesson topic",
          description: "I am the second lesson description",
          course_order: 2
    )
  end 

  test 'should be valid' do 
    assert @lesson_topic.valid?
  end 

  test 'Name should be present' do 
     @lesson_topic.name = nil 
     assert_not @lesson_topic.valid?
  end 

  test 'description should be present' do 
    @lesson_topic.description = nil 
    assert_not @lesson_topic.valid?
  end 

  test 'course order should be present' do 
    @lesson_topic.course_order = nil 
    assert_not @lesson_topic.valid?
  end 
end
