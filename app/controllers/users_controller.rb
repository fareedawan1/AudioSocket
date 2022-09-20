# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(profile_params)
    redirect_to albums_path
  end

  private

  def profile_params
    params.require(:user).permit(:image, :country, :bio, :website_link, :social_link)
  end
end
