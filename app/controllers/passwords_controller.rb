# frozen_string_literal: true

# PasswordController
class PasswordsController < Devise::PasswordsController
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    return unless resource.errors.empty?

    sign_in(resource_name, resource)
    respond_with resource, location: edit_user_path(resource)
  end

  protected

  def after_resetting_password_path_for(resource)
    redirect_to edit_user_path(resource)
  end
end
