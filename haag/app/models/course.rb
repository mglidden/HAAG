class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments, :dependent => :destroy
  
  validates_presence_of :name
  
  # required by nested_form
  accepts_nested_attributes_for :assignments
  
  def short_name
    name.split(' ', 2).first
  end
  
  # TODO: this method is duplicated in various models and should be extracted to a module
  def self.json_for_validation(attribute_name, attribute_value_as_string)
    column = self.columns_hash[attribute_name]
    attribute_type = column.type
    
    attribute_value = case attribute_type
    when :datetime then DateTime.strptime(attribute_value_as_string,"%m/%d/%Y")
    else attribute_value_as_string
    end

    instance = self.new(attribute_name => attribute_value)
    instance.valid?
    if instance.errors[attribute_name].present?
      attribute_symbol = attribute_name.to_sym
      ajax_response = { :valid => false, attribute_symbol => instance.errors[attribute_name] }
    else
      ajax_response = { :valid => true }
    end
  end
   
end
