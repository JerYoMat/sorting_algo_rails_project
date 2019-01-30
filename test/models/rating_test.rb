require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  def setup 
    @user = users(:test_user_michael)
    @tip = tips(:test_tip1)
    @rating = @user.ratings.build(
      user_id: 1000,
      tip_id: 1,
      stars: 4
      )

  end 

  test 'should be valid' do 
    assert @rating.valid?
  end 

  test 'User ID should be present' do 
     @rating.user_id = nil 
     assert_not @rating.valid?
  end 

  test 'tip id should be present' do 
    @rating.tip_id = nil 
    assert_not @rating.valid?
  end 

  test 'number stars should be present' do 
    @rating.stars = nil 
    assert_not @rating.valid?
  end 

end