class AssignmentsListsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @list = AssignmentsList.new
    @list.assignments << Assignment.new
    @courses = current_user.courses
    
    render :layout => false
  end
  
  def create
    if params['commit'] == 'Cancel'
      redirect_to root_path, :notice => 'Your changes were discarded.'
      return      
    end
    
    @list = AssignmentsList.new(params['assignments_list'])
    @courses = current_user.courses
    @list.assignments.each { |assignment| assignment.creator = current_user }
   
    # remove blank assignments to avoid unnecessary error messages
    @list.assignments.delete_if do |assignment| 
      assignment.description.blank? && assignment.due_at.blank? 
    end
   
    if @list.save
      @list.assignments.each { |assignment| assignment.save }
      redirect_to root_path, :notice => 'Assignments created successfuly.'
    else
      render :action => 'new'
    end    
  end
  
end