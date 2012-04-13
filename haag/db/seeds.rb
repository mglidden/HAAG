# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adrian = User.find_or_create_by_email(
  :name => 'Adrian V. Mullings', 
  :email => 'mullings@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

mason = User.find_or_create_by_email(
  :name => 'Mason G. Glidden', 
  :email => 'mglidden@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

ricardo = User.find_or_create_by_email(
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

microelectronics = Course.find_or_create_by_short_name(
  :short_name => '6.012',
  :long_name => 'Microelectronic Devices and Circuits'
) 

nanoquiz_makeup = Assignment.find_or_create_by_description(
  :creator => adrian,
  :description => 'Nanoquiz Makeup',
  :course => user_interface_design,
  :due_at => 1.day.from_now
)

therac_reading = Assignment.find_or_create_by_description(
  :creator => mason,
  :description => 'Reading Therac paper',
  :course => computer_system_engineering,
  :due_at => 2.days.from_now
)

ps1 = Assignment.find_or_create_by_description(
  :creator => ricardo,
  :description => 'Problem Set 1',
  :course => microelectronics,
  :due_at => 5.days.from_now
)

User.all.each do |user|
  if user.courses.empty?
    user.courses << [ computer_system_engineering, user_interface_design ]
  end
        
  if user.tasks.empty?
    user.tasks.create(:assignment => nanoquiz_makeup)
    user.tasks.create(:assignment => therac_reading)
  end
end
