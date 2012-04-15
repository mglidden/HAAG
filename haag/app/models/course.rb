require 'live_validator'

# module LiveValidator
    # def validate_field(field, value)       
      # instance = self.new(field => value)
      # instance.valid?    
      # if instance.errors[field].present?
        # ajaxResponse = { :valid => false, field.to_sym => instance.errors[field] }
      # else
        # ajaxResponse = { :valid => true }
      # end    
    # end
# end

class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments, :dependent => :destroy
  
  validates_presence_of :name
  
  # def self.validate_field(field, value)
    # instance = Course.new(field => value)
    # instance.valid?    
    # if instance.errors[field].present?
      # ajaxResponse = { :valid => false, field.to_sym => instance.errors[field] }
    # else
      # ajaxResponse = { :valid => true }
    # end  
  # end
  
  #include LiveValidator
  extend LiveValidator
    
  def short_name
    name.split(' ', 2).first
  end
    
end
