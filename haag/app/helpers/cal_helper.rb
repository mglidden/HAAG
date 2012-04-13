module CalHelper
  class CalDate
    attr_accessor :day, :month, :assignment_lst

    def initialize(day, month, assignment_lst)
      self.day = day
      self.month = month
      self.assignment_lst = assignment_lst
    end
  end
end
