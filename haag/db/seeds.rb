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

Course.find_or_create_by_name(
  :name => '6.033 Computer System Engineering'
)

Course.find_or_create_by_name(
  :name => '6.813 User Interface Design'
)

