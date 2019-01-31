require 'pry'
class StaticPagesController < ApplicationController
  def home 
     if logged_in? 
       @user = current_user 
       @tips = current_user.tips
     end 
  end

  def about 
  end 
end
