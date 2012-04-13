class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /assignments
  def index
    @course = Course.find(params[:course_id])
    @assignments = @course.assignments
  end

  # GET /assignments/1
  def show
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:id])
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
    @courses = current_user.courses
    
    render :layout => false
  end

  # GET /assignments/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  def create
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new(params[:assignment])
    @assignment.creator = current_user
    @assignment.course = @course
    due_date = params[:assignment][:due_at]
    @assignment.due_at = DateTime.strptime(due_date,"%m/%d/%Y")

    if @assignment.save
      redirect_to root_path, notice: 'Assignment was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /assignments/1
  def update
    @assignment = Assignment.find(params[:id])

    if @assignment.update_attributes(params[:assignment])
      redirect_to @assignment, notice: 'Assignment was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    redirect_to assignments_url
  end
end
