module CalHelper
  class CalDate
    attr_accessor :date, :assignment_lst

    def initialize(date, assignment_lst)
      self.date = date
      self.assignment_lst = assignment_lst
    end
  end
end
