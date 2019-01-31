class TipsController < ApplicationController
before_action :logged_in_user, only:[:new, :create, :edit, :update, :destroy]
  def new
    @tip = Tip.new 
  end 

  def create 

  end 

  def edit 
  end 

  def update 
  end 

  def show 
  end  

  def destroy 
  end 

private 
  def user_params
    params.require(:tip).permit(:name, :description, :lesson_topic, :resource_link)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end 


end
