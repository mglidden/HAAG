class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments
  
  validates_presence_of :long_name
  validates_presence_of :short_name
  validates_length_of :short_name, :maximum => 15
  
  def name
    "#{short_name} #{long_name}"
  end
  
  def self.validate_field(field, value)
    instance = Course.new(field => value)
    instance.valid?    
    if instance.errors[field]
      ajaxResponse = {:valid => false, field.to_sym => instance.errors[field]}
    else
      ajaxResponse = {:valid => true}
    end  
  end
    
end
