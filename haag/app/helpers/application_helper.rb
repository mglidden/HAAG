module ApplicationHelper

  # Generate a button which redirects to the given url  
  def link_button_to(button_text, url, html_options = {})
    html_options[:class] = "#{html_options[:class]} link-button-to".strip
    link_to(content_tag(:button, button_text, :type => 'button'), url, html_options)
  end

  def script_for_live_validation()
    javascript_tag "activateLiveValidation();"
  end
  
  def title(title_str)
    content_for(:title) { title_str }
  end

  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end    
      else
        html << "<h5>#{message}</h5>"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end  
end
