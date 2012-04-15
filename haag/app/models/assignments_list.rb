class AssignmentsList < ActiveRecord::Base
  has_and_belongs_to_many :assignments
  accepts_nested_attributes_for :assignments 
  attr_accessible :assignments_attributes
end
