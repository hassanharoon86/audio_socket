class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_invitable_parameters, if: :devise_controller?

  def verify_artist_user
    redirect_to root_path unless current_user.artist?
  end

  def verify_manager_user
    redirect_to root_path if !current_user.manager?
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :terms_of_service])
  end

  def configure_permitted_invitable_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email])
  end
end
