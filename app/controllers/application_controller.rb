class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!
   
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :phone, :address,:role,:city_id])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin? || current_user.seller?
    admin_categories_path
    else 
      root_path
    end
  end
end
