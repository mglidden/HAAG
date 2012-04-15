class AssignmentsListsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @list = AssignmentsList.new
    @list.assignments << Assignment.new
    @courses = current_user.courses
  end
  
  def create
    @list = AssignmentsList.new(params['assignments_list'])
    @courses = current_user.courses
    @list.assignments.each { |assignment| assignment.creator = current_user }
   
    if @list.save
      @list.assignments.each { |assignment| assignment.save }
      redirect_to root_path, :notice => 'Assignments created successfuly.'
    else
      render :action => 'new'
    end    
  end
  
end