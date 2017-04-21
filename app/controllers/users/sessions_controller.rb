class Users::SessionsController < ::Devise::SessionsController
  def create
    super
  end

  def destroy
  	super
  end

  def after_sign_in_path_for(_resource)
    if current_user.owner?
      return restaurants_path
    elsif current_user.customer?
      return search_restaurants_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
