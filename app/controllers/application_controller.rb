class ApplicationController < ActionController::Base
  include SessionsHelper

  private 
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in to view this page."
      redirect_to login_url
    end 
  end 

  def set_user
    @user = User.find(params[:id])
  end 

  def correct_user 
    @user = current_user
    redirect_to root_url unless @user == current_user
  end 
end
