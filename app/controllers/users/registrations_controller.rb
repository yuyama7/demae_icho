class Users::RegistrationsController < ::Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    super
  end

  def create
    build_resource sign_up_params
    if resource.save
      redirect_to new_user_session_path
    else
      redirect_to new_user_registration_path(resource)
    end
  end

  def edit
  end

  def update
    build_resource edit_params
    if resource.save
      redirect_to new_user_session_path
    else
      redirect_to edit_user_registration_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :location, :account_type) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :location, :account_type) }
  end

end
