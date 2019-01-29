class UsersController < ApplicationController
  before_action :set_user, only: [:show, :create]
  
  def new
    @user = User.new 
  end

  def show 
    set_user
  end 

  def create 
    #some stuff
    if @user.save 
    else 
      render 'new'
    end 
  end 



private 

def user_params
  params.require(:user).permit(:name, :email, :password,
                               :password_confirmation, :smoker)
end

  def set_user
    @user = User.find(params[:id])
  end  
end 