class TipsController < ApplicationController
before_action :logged_in_user, only:[:new, :create, :edit, :update, :destroy]
before_action :correct_user, only: [:create, :edit, :update, :destroy] 
before_action :set_tip, only: [:create, :edit, :update, :show, :destroy]
  def new
    @tip = Tip.new 
  end 

  def create 
    @tip = current_user.tips.build(tip_params)
    if @tip.save
      flash[:success] = "Thanks! Your tip has been added."
      redirect_to root_path
    else
      @options = LessonTopic.all.map{|l| [l.name, l.id]}    
      render 'static_pages/home'
    end
  end 

  def edit 
  end 

  def update 
  end 

  def show 
  end  

  def destroy 
     @tip.destroy
  end 

private 
  def user_params
    params.require(:tip).permit(:name, :description, :lesson_topic, :resource_link)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end 


end
