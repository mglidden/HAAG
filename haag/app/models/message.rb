class Message < ActiveRecord::Base
  # belongs_to :user
  # alias :recipient :user
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'user_id'
  
  belongs_to :assignment 

end
