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
  
  def self.validate_field(field, value)
    instance = Assignment.new(field => value)
    instance.valid?    
    if instance.errors[field]
      ajaxResponse = {:valid => false, field.to_sym => instance.errors[field]}
    else
      ajaxResponse = {:valid => true}
    end  
  end  
end
