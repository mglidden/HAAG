module ApplicationHelper

  # Generate a button which redirects to the given url  
  def link_button_to(button_text, url, html_options = {})
    html_options[:class] = "#{html_options[:class]} link-button-to".strip
    link_to(content_tag(:button, button_text, :type => 'button'), url, html_options)
  end

  def script_for_live_validation()
    javascript_tag "activateLiveValidation();"
  end

end
