# frozen_string_literal: true

# AlbumsController
class AlbumsController < ApplicationController
  def index
    @albums = current_user.albums
  end

  def create
    @album = current_user.albums.create(album_params)
    if @album.save
      redirect_to albums_path
    else
      render new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    redirect_to albums_path if @album.destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :image)
  end
end
