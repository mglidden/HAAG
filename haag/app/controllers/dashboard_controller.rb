require 'date'

class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @courses = Course.all
    date = Date.new(Time.new.year, Time.new.month, Time.new.day)
    @start_day = (date - (date.wday + 7)).mday
    @days_month = 30
    @days_month = (Date.new(date.year, 12, 31) << (12-date.month)).day
  end
  
end
