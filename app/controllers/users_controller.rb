require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    @user = User.new 
  end

  def show 
  
  end 

  def create
  
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "welcome to BURNorSPURN"
      redirect_to @user 
    else 
      render 'new'
    end 
  end 



private 

def user_params
  params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :smoker, :cigs_per_day)
end

  def set_user
    @user = User.find(params[:id])
  end  
end 