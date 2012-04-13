class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments
  
  validates_presence_of :long_name
  validates_presence_of :short_name
  validates_length_of :short_name, :maximum => 15
  
  def name
    "#{short_name} #{long_name}"
  end
end
