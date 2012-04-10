# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(
  :name => 'Adrian V. Mullings', 
  :email => 'mullings@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

user = User.create!(
  :name => 'Mason G. Glidden', 
  :email => 'mglidden@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

user = User.create!(
  :name => 'Ricardo P. Jasinski', 
  :email => 'jasinski@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'

)