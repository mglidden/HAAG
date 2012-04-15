# This model only exists so that we can take advantage of Rails' 
# nested_attributes when creating and validating multiple assignments.
class AssignmentsList < ActiveRecord::Base
  has_and_belongs_to_many :assignments
  accepts_nested_attributes_for :assignments 
end
