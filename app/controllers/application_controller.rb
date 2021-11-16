class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :configure_permitted_invitable_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :terms_of_service])
  end

  def configure_permitted_invitable_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email])
  end
end
