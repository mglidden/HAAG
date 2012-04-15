class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :tasks
  
  validates_presence_of :description
  validates_presence_of :due_at
  
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
  
  def self.validate_field(attribute_name, value)
    attribute_type = self.columns_hash[attribute_name].type
    attribute_symbol = attribute_name.to_sym
    
    if attribute_type == :datetime
      instance = Assignment.new(attribute_symbol => DateTime.strptime(value,"%m/%d/%Y"))
    else
      instance = Assignment.new(attribute_symbol => value)
    end

    instance.valid?
    if instance.errors[attribute_name].present?
      ajax_response = {:valid => false, attribute_symbol => instance.errors[attribute_name]}
    else
      ajax_response = { :valid => true }
    end
  end  
end
