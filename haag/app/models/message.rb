class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  
  alias :recipient :user
end
