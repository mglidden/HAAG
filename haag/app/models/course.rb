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
    validity = Course.new(field => value)
    p validity
    p validity.valid?
    p validity.errors
    
    validity.valid?    
    if validity.errors[field] and !validity.valid?
      ajaxResponse = {:valid => false, field.to_sym => validity.errors[field]}
    else
      ajaxResponse = {:valid => true}
    end  
  end
    
end
