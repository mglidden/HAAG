module CalHelper
  class CalDate
    attr_accessor :day, :month, :year, :assignment_lst

    def initialize(day, month, year, assignment_lst)
      self.day = day
      self.month = month
      self.year = year
      self.assignment_lst = assignment_lst
    end
  end
end
