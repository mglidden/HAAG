# http://stackoverflow.com/questions/8146590/devise-sign-in-issue-with-jquery-mobile-and-rails
ActionController::Responder.class_eval do
  alias :to_mobile :to_html
end