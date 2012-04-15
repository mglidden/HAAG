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
  :password => '1234567890',
  :password_confirmation => '1234567890'
)

ricardo = User.find_or_create_by_email(
  :name => 'Ricardo P. Jasinski', 
  :email => 'jasinski@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

computer_system_engineering = Course.find_or_create_by_short_name(
  :name => '6.033 Computer System Engineering',
  :color => 'rgb(229,162,142)'
)

user_interface_design = Course.find_or_create_by_short_name(
  :name => '6.813/6.831 User Interface Design',
  :color => 'rgb(129,192,102)'
)

microelectronics = Course.find_or_create_by_short_name(
  :name => '6.012 Microelectronic Devices and Circuits',
  :color => 'rgb(129,192,102)'
) 

User.all.each do |user|
  if user.courses.empty?
    user.courses << [ computer_system_engineering, user_interface_design ]
  end
end

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
  if user.tasks.empty?
    user.tasks.create(:assignment => nanoquiz_makeup)
    user.tasks.create(:assignment => therac_reading)
  end
end

