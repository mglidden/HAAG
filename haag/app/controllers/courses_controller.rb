require 'date'
include CoursesHelper

class CoursesController < ApplicationController
  before_filter :authenticate_user!

  def validate
    render :json => Course.json_for_validation(params[:attribute_name], params[:attribute_value])
  end
  
  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new    
    render :layout => false
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  def create
    @course = Course.new(params[:course])
    @course.color = random_color_str
    
    if @course.save
      current_user.courses.push(@course)
      current_user.save
      redirect_to root_path, notice: 'Course was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /courses/1
  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to root_path, notice: 'Course was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /courses/1
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end
end
