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
    course.assignments.each do |a|
      user.tasks.create(:assignment => a)
    end
    
    if user.save
      redirect_to root_path, notice: 'Class added successfully.'
    else
      render action: "new"
    end    
  end

  def destroy
    course = Course.find(params[:course_id])
    user = User.find(params[:user_id])
    user.courses.delete(course)
    user.tasks = user.tasks.find_all do |task|
      task.assignment.course != course
    end
    user.save
    redirect_to :controller => '/dashboard', :action => 'show'
  end

end
