class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company, :telephone, :biography, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company, :telephone, :biography, :photo])
  end
  
  def agent_properties
    @properties = Property.all
    @agent_properties = current_account.properties
  end
  
  def can_access?
    unless current_account.admin?
      redirect_to root_path
    end
  end
end
