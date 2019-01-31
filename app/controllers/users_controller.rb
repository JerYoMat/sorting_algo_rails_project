require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only:[:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  def new
    @user = User.new 
  end

  def show #Show User data and the tips that they have provided 
    if @user.tips
    @tips = @user.tips
    else  
      @tips = []
    end

  end 

  def create
    @user = User.new(user_params)
    if @user.save 
      log_in(@user)
      flash[:success] = "welcome to BURNorSPURN"
      redirect_to @user 
    else 
      render 'new'
    end 
  end 

  def edit 
  end 

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end 
  end 

  def index 
    @users = User.all 
  end 

  def destroy 
  end 



private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :has_graduated)
  end


end 