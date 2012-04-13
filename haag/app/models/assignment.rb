class Assignment < ActiveRecord::Base
  belongs_to :course
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
  has_many :tasks
  
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
