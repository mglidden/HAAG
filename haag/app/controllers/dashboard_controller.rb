require 'date'
include CalHelper

class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @courses = Course.all

    today = Date.new(Time.new.year, Time.new.month, Time.new.day)
    @start_day = (today - (today.wday + 7)).mday
    @days_month = (Date.new(today.year, 12, 31) << (12-today.month)).day

    @shown_tasks = []
    (0..27).each do |i|
      @shown_tasks[i] = []
    end

    @user.tasks.each do |task|
      assignment = task.assignment
      due_date = assignment.due_at
      unless due_date
        break
      end
      if due_date.year == today.year 
        if due_date.day >= @start_day and due_date.month == today.month
          @shown_tasks[due_date.day - @start_day + 1].push(task)
        elsif due_date.day <= @days_month - 28 + @start_day and 
          @shown_tasks[due_date.day + @days_month - @start_day + 1].push(task)
        end
      end
    end
    
    @shown_tasks = @shown_tasks.enum_for(:each_with_index).collect do |tasks, index|
      day = (index + @start_day - 1) % @days_month + 1
      month = (index + @start_day - 1) / @days_month + today.month
      year = today.year
      CalDate.new(day, month, year, tasks)
    end    
    
    respond_to do |format|
      format.html
      format.mobile
    end    
  end
  
end
