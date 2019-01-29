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
 
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 256 
    assert_not @user.valid? 
  end 

  test "email should not be too long" do 
    @user.email = "abc" * 85 + "@example.com"
    assert_not @user.valid?  
  end 

  test "email validation should accept valid addresses" do 
    valid_email_addresses = %w[test1@example.com TEST@EXAMPLE.CoM with.period@999.com FOREIGN@Gruen.de]
    valid_email_addresses.each do |single_address|
      assert @user.valid?, "#{single_address.inspect} should be valid"  #this is a custome error message
    end 
  end 

  test "email validation should reject invalid email addresses" do 
      invalid_email_addresses = %w[firstlast gmail.com something+something !@#$%]
      invalid_email_addresses.each do |single_address|
        @user.email = single_address
        assert_not @user.valid?, "#{single_address.inspect} should not be valid."
      end 
  end 
end
