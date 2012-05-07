class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :prepare_for_mobile

  # Overwrite Devise method -- redirect user to the sign in page after sign out  
  # http://devise.plataformatec.com.br/#getting-started/controller-filters-and-helpers
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def render_with_layout_as_needed(options={})
    render options.merge(:layout => !request.xhr?)
  end

  
private
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?

    # if (devise_controller? && action_name == 'create' && request.method == 'POST')
      # request.format = :html
    # end
  end
  
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  
  helper_method :mobile_device?
  
end
