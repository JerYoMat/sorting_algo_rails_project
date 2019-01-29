require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup #setup method automaticall is run before each test 
  @user = User.new(name: "UserTest Name", email: "user@usertestcase.com")
 end 

 test "should be valid" do 
   assert @user.valid?   
 end
 
 test "name should be present" do 
   @user.name = "   "
   assert_not @user.valid?   
 end 
end
