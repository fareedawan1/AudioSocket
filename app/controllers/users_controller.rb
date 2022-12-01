# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]
  def edit; end

  def update
    @user.update(profile_params)
    redirect_to albums_path    
  end

  private

  def profile_params
    params.require(:user).permit(:image, :country, :bio, :website_link, social_link: [])
  end

  def find_user
    @user = User.find(params[:id])
  end
end
