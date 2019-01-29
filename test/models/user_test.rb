require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup #setup method automaticall is run before each test 
    @user = User.new(name: "UserTest Name", email: "user@usertestcase.com", password: "valid_long_password", password_confirmation: "valid_long_password")
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

  test "email address should be unique" do 
    duplicate_user = @user.dup 
    duplicate_user.email = @user.email.upcase
    @user.save 
    assert_not duplicate_user.valid?
  end 

  test "email addresses should exist in db only as lower case" do 
    mixed_case_email = "CAP@example.com"
    @user.email = mixed_case_email
    @user.save 
    assert_equal mixed_case_email.downcase, @user.reload.email 
  end 

  test "password should be present" do 
     @user.password = @user.password_confirmation = " " * 6 
     assert_not @user.valid?
  end 

  test "password should be a minimum length" do 
    @user.password = @user.password_confirmation = "123"
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "1234567"
    assert @user.valid?
  end 
end
