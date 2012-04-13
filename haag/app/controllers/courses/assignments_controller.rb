class Courses::AssignmentsController < ApplicationController
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
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  def create
    @course = Course.find(params[:course_id])
    @assignment = @course.assignments.create()
    @assignment.description = params[:assignment][:description]

    if @assignment.save
      redirect_to @course, notice: 'Assignment was successfully created.'
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
