# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Haag::Application.initialize!

# Time::DATE_FORMATS[:default] = "%b %d, %I:%M %p"
# Time::DATE_FORMATS[:datepicker] = "%m/%d/%y"

Time::DATE_FORMATS[:default] = "%m/%d/%y"
Time::DATE_FORMATS[:message] = "%b %d, %I:%M %p"

Date::DATE_FORMATS[:default] = "%m/%d/%y"
Date::DATE_FORMATS[:message] = "%b %d, %I:%M %p"
