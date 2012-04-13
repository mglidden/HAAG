class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments
  
  def name
    "#{short_name} #{long_name}"
  end
end
