class TasksController < ApplicationController
  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      if mobile_device?
        redirect_to root_path, notice: 'Task was successfully updated.'
      else
        redirect_to @task, notice: 'Task was successfully updated.'
      end
    else
      render action: "edit"
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_url
  end

  def toggle
    @task = Task.find(params[:id])
    @task.toggle_completed
    @task.save
    render :layout => false, :inline => "task toggled"
  end

  def complete
    @task = Task.find(params[:id])
    @task.mark_as_completed
    @task.save
    render :layout => false, :inline => "task completed"
  end
  
  def update_completion
    @task = Task.find(params[:id])
    p params[:completed]
    # if @task.update_attributes(params[:task])
      # redirect_to @task, notice: 'Task was successfully updated.'
    # else
      # render action: "edit"
    # end    
  end
end
