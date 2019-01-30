require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def new
    @user = User.new 
  end

  def show 
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
  end 

  def destroy 
  end 



private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :smoker, :cigs_per_day)
  end

  def set_user
    @user = User.find(params[:id])
  end 

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in to view this page."
      redirect_to login_url
    end 
  end 

  def correct_user 
    set_user
    redirect_to root_url unless @user == current_user
  end 
end 