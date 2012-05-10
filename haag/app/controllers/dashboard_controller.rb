require 'date'
include CalHelper

class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @courses = Course.all

    delta = params[:delta] ? params[:delta].to_i * 28 : 0

    today = Date.new(Time.new.year, Time.new.month, Time.new.day) + delta
    @start = (today - (today.wday + 7))
    @end = @start + 27
    @days_month = (Date.new(@start.year, 12, 31) << (12-@start.month)).day

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
      if due_date >= @start and due_date <= @end
        if due_date.month == @start.month
          @shown_tasks[due_date.day - @start.day + 1].push(task)
        else
          @shown_tasks[due_date.day + @days_month - @start.day + 1].push(task)
        end
      end
    end
    
    @mobile_tasks = @shown_tasks

    @shown_tasks = @shown_tasks.enum_for(:each_with_index).collect do |tasks, index|
      day = (index + @start.mday - 1) % @days_month + 1
      month = (index + @start.mday - 1) / @days_month + today.month - 1
      year = today.year
      CalDate.new(day, month, year, tasks)
    end    
    
    respond_to do |format|
      format.html
      format.mobile
    end    
  end
  
end
