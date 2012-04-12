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

computer_system_engineering = Course.find_or_create_by_name(
  :name => '6.033 Computer System Engineering'
)

user_interface_design = Course.find_or_create_by_name(
  :name => '6.813 User Interface Design'
)

Assignment.find_or_create_by_description(
  :description => 'Nanoquiz Makeup',
  :course => user_interface_design
)

Assignment.find_or_create_by_description(
  :description => 'Reading Therac paper',
  :course => computer_system_engineering
)

User.all.each do |user|
  if user.courses.empty?
    user.courses << computer_system_engineering;
    user.courses << user_interface_design;
    user.save!
  end
end
