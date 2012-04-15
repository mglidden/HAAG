class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :tasks
  
  validates_presence_of :description
  validates_presence_of :due_at

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
  
  after_create do |assignment|
    course.users.each do |user|
      content = "#{course.short_name} #{creator.name} created the assignment " +
        "#{assignment.description}, due on #{assignment.due_at}" 
      message = Message.create(
        :content => content,
        :recipient => user,
        :assignment => assignment
      )
    end
  end
end
