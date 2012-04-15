class AssignmentsListsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @list = AssignmentsList.new
    @list.assignments << Assignment.new
  end
  
  def create
    p params
    redirect_to root_path, :notice => 'Awesome!'
  end
  
end