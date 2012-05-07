class ApplicationController < ActionController::Base
  protect_from_forgery

  # Overwrite Devise method -- redirect user to the sign in page after sign out  
  # http://devise.plataformatec.com.br/#getting-started/controller-filters-and-helpers
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def render_with_layout_as_needed(options={})
    render options.merge(:layout => !request.xhr?)
  end

private
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  
  helper_method :mobile_device?
  
end
