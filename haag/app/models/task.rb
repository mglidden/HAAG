# A Task is a relation between an Assignment and a User. An Assignment is a 
# common object that many Users can add to their calendars. A Task is an
# Assignment specific to a User. Tasks can be completed; Assignments can't. 
class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  
  def completed?
    not completed_at.nil?
  end
  
  def mark_as_completed
    update_attribute(:completed_at, Time.current)
  end

end