# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_create_by_email(
  :name => 'Adrian V. Mullings', 
  :email => 'mullings@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

User.find_or_create_by_email(
  :name => 'Mason G. Glidden', 
  :email => 'mglidden@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

User.find_or_create_by_email(
  :name => 'Ricardo P. Jasinski', 
  :email => 'jasinski@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'

)

computer_system_engineering = Course.find_or_create_by_short_name(
  :short_name => '6.033',
  :long_name => 'Computer System Engineering'
)

user_interface_design = Course.find_or_create_by_short_name(
  :short_name => '6.813/6.831',
  :long_name => 'User Interface Design'
)

nanoquiz_makeup = Assignment.find_or_create_by_description(
  :description => 'Nanoquiz Makeup',
  :course => user_interface_design,
  :due_at => 1.day.from_now
)

therac_reading = Assignment.find_or_create_by_description(
  :description => 'Reading Therac paper',
  :course => computer_system_engineering,
  :due_at => 2.days.from_now
)

User.all.each do |user|
  user.courses << Course.all if user.courses.empty?   
  if user.tasks.empty?
    user.tasks.create(:assignment => nanoquiz_makeup)
    user.tasks.create(:assignment => therac_reading)
  end
end
