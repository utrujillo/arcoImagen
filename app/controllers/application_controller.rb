class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource
  
  protected
    def layout_by_resource
      if devise_controller?
        "devise_login"
      else
        "application"
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellidos])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:nombre, :apellidos])
    end

    def after_sign_in_path_for(resource)
      admin_welcome_index_path
    end
end
