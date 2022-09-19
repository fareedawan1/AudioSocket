# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_resetting_password_path_for(_user)
    redirect_to new_audition_path
  end
end
