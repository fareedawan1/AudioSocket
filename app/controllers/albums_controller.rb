# frozen_string_literal: true

# AlbumsController
class AlbumsController < ApplicationController
  before_action :find_album, only: %i[show edit update destroy]
  def index
    @albums = Album.all.where(user_id:current_user)
  end

  def create
    @album = current_user.albums.create(album_params)
    if @album.save
      redirect_to albums_path
    else
      render new
    end
  end

  def edit; end

  def show; end

  def update
    if @album.update(album_params)
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to albums_path if @album.destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :image)
  end

   def find_album
    @album = Album.find(params[:id])
   end
end
