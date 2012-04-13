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

    @shown_assignments = []
    (0..27).each do |i|
      @shown_assignments[i] = []
    end

    # rpj: I had to change it to show only the assignments associated  
    # with thecurrent  user (through a task); otherwise, all assignments  
    # for all courses would be shown

    # @user.courses.each do |course|
      # puts course.long_name
      # course.assignments.each do |assignment|
      @user.tasks.each do |task|
        assignment = task.assignment
        puts assignment.description
        due_date = assignment.due_at
        unless due_date
          break
        end
        if due_date.year == today.year 
          if due_date.day >= @start_day and due_date.month == today.month
            @shown_assignments[due_date.day - @start_day + 1].push(assignment)
          elsif due_date.day <= @days_month - 28 + @start_day and 
            @shown_assignments[due_date.day + days_month - @start_day + 1].push(assignment)
          end
        end
      end
    # end

    @shown_assignments = @shown_assignments.enum_for(:each_with_index).collect do |assignments, index|
      day = (index + @start_day - 1) % @days_month + 1
      CalDate.new(day, assignments)
    end
  end
  
end
