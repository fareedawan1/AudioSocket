# frozen_string_literal: true

# TrackController
class TracksController < ApplicationController
  before_action :find_album, only: %i[create edit update destroy]
  def new; end

  def create
    @album = Album.find_by(id: params[:album_id])
    @track = @album.tracks.build(track_params)
    redirect_to album_path(@album) if @track.save
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    redirect_to album_path(@album) if @track.update(track_params)
  end

  def destroy
    @track = Track.find(params[:id])
    redirect_to album_path(@album) if @track.destroy
  end

  private

  def track_params
    params.require(:track).permit(:title, :song)
  end

  def find_album
    @album = Album.find_by(id: params[:album_id])
  end
end
