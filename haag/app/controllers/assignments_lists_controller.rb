class AssignmentsListsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @list = AssignmentsList.new
    @list.assignments << Assignment.new
    @courses = current_user.courses
  end
  
  def create
    p params
    assignments_list = params['assignments_list'].dup 
    # assignments_list['assignments_attributes'].each do |key,value|
      # datepicker_string = value['due_at']
      # rails_date = DateTime.strptime(datepicker_string,"%m/%d/%Y") 
      # rails_date_string = rails_date.strftime('%Y-%m-%d') 
      # value['due_at'] = rails_date_string
    # end
    p params
    
    # @list = AssignmentsList.new(assignments_list)
    
    # assignments_list.each_pair do |assignment|
      # Assignment.new(assignment)
    # end
#     
    @list = AssignmentsList.new(assignments_list)
    
    @courses = current_user.courses
    @list.assignments.each { |assignment| assignment.creator = current_user }
   
    #if @list.save
    if @list.valid?
      p @list
      @list.save
      @list.assignments.each { |assignment| assignment.save }
      redirect_to root_path, :notice => 'Awesome!'
    else
      render :action => 'new'
    end    
  end
  
end