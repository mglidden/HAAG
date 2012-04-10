class ApplicationController < ActionController::Base
  protect_from_forgery

  # Overwrite Devise method -- redirect user to the sign in page after sign out  
  # http://devise.plataformatec.com.br/#getting-started/controller-filters-and-helpers
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end  
end
