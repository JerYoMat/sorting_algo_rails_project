require 'pry'

class TipsController < ApplicationController
before_action :logged_in_user, only:[ :create, :destroy]
before_action :set_tip, only: [:destroy, :edit, :show]
  def new
    @tip = Tip.new 
    @options = LessonTopic.all.map{|l| [l.name, l.id]}.unshift(['', -1])  
  end 

  def create 
    @tip = current_user.tips.build(tip_params)
    if @tip.save
      flash[:success] = "Thanks! Your tip has been added."
      redirect_to root_path
    else
    
      @options = LessonTopic.all.map{|l| [l.name, l.id]}.unshift(['', -1])    
      @user = current_user
        render 'tips/new'
     
    end
  end 

  def edit 
    if current_user != @tip.user 
      redirect_to root_path 
    end 
  end 

  def update 
  end 

  def show 
  end  

  def destroy 
    if current_user != @tip.user 
      redirect_to root_path 
    else 
      @tip.destroy
    end 
  end 

  def index 
  end 

private 
  def tip_params
    params.require(:tip).permit(:name, :description, :lesson_topic_id, :resource_link)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end 


end
