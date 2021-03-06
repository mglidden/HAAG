class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :tasks
  
  validates_presence_of :description
  validates_presence_of :due_at
  
  def due_at=(due_at_str)
    begin
      due_at_date_time = DateTime.strptime(due_at_str,"%m/%d/%Y")
      write_attribute(:due_at, due_at_date_time)
    rescue
      errors.add(:due_at, 'must be a valid date')
    end
  end


  # TODO: this method is duplicated in various models and should be extracted to a module
  def self.json_for_validation(attribute_name, attribute_value)
    column = self.columns_hash[attribute_name]
    attribute_type = column.type
    
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
      if user.email == creator.email
        user.tasks.create(:assignment => assignment)
      elsif shared?
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
end
