class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    if current_user.owner?
      return restaurants_path
    elsif current_user.customer?
      return search_restaurants_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :account_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location])
  end
end
