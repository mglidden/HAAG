class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @courses = Course.all
    @start_day = 5
    @days_month = 30    
  end
  
end