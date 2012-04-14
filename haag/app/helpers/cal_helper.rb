module CalHelper
  class CalDate
    attr_accessor :day, :month, :year, :tasks

    def initialize(day, month, year, tasks)
      self.day = day
      self.month = month
      self.year = year
      self.tasks = tasks
    end
  end
end
