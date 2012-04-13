class Users::SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @unsubscribed_courses = Course.all - @user.courses
    @default_course = @unsubscribed_courses.first  
    
    render :layout => false    
  end
  
  def create
    course = Course.find(params[:course_id])
    user = User.find(params[:user_id])
    user.courses << course    
    
    if user.save
      redirect_to course, notice: 'Course was successfully created.'
    else
      render action: "new"
    end    
  end

end