class AssignmentsListsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @list = AssignmentsList.new
    # assignment = Assignment.new(:creator => current_user)
    @list.assignments << Assignment.new
    @courses = current_user.courses
  end
  
  def create
    p params
    @list = AssignmentsList.new(params[:assignments_list])
    @courses = current_user.courses

    # 
    @list.assignments.each { |assignment| assignment.creator = current_user }

   
    if @list.save
      p @list
      @list.assignments.each { |assignment| assignment.save }
      redirect_to root_path, :notice => 'Awesome!'
    else
      render :action => 'new'
    end    
  end
  
end