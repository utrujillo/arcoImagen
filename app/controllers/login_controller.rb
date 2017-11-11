class LoginController < ApplicationController
  layout 'devise_login'
  
  def index
    if current_user.present?
      redirect_to admin_welcome_index_path
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
