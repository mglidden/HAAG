# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include CoursesHelper

adrian = User.find_or_create_by_email(
  :email => 'mullings@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

mason = User.find_or_create_by_email(
  :email => 'mglidden@mit.edu',
  :password => '1234567890',
  :password_confirmation => '1234567890'
)

ricardo = User.find_or_create_by_email(
  :email => 'jasinski@mit.edu',
  :password => 'secret',
  :password_confirmation => 'secret'
)

random_colors = (0..2).collect {|i| random_color}
computer_system_engineering = Course.find_or_create_by_name(
  :name => '6.033 Computer System Engineering',
  :color => color_str(random_colors[0]),
  :finished_color => color_str(darken_color(random_colors[0]))
)

user_interface_design = Course.find_or_create_by_name(
  :name => '6.813/6.831 User Interface Design',
  :color => color_str(random_colors[1]),
  :finished_color => color_str(darken_color(random_colors[1]))
)

microelectronics = Course.find_or_create_by_name(
  :name => '6.012 Microelectronic Devices and Circuits',
  :color => color_str(random_colors[2]),
  :finished_color => color_str(darken_color(random_colors[2]))
) 

User.all.each do |user|
  if user.courses.empty?
    user.courses << [ computer_system_engineering, user_interface_design ]
  end
end

nanoquiz_makeup = Assignment.find_or_create_by_description(
  :creator => adrian,
  :description => 'Nanoquiz Makeup',
  :course_id => user_interface_design.id,
  :due_at => 1.day.from_now.strftime('%m/%d/%Y')
)

therac_reading = Assignment.find_or_create_by_description(
  :creator => mason,
  :description => 'Reading Therac paper',
  :course_id => computer_system_engineering.id,
  :due_at => 2.days.from_now.strftime('%m/%d/%Y')
)

ps1 = Assignment.find_or_create_by_description(
  :creator => ricardo,
  :description => 'Problem Set 1',
  :course_id => microelectronics.id,
  :due_at => 5.days.from_now.strftime('%m/%d/%Y')
)

# User.all.each do |user|
  # if user.tasks.empty?
    # user.tasks.create(:assignment => nanoquiz_makeup)
    # user.tasks.create(:assignment => therac_reading)
  # end
# end

