# frozen_string_literal: true

# TrackController
class TracksController < ApplicationController
  before_action :find_album, only: %i[create edit update destroy]
  before_action :find_track, only: %i[edit update destroy]
  def new; end

  def create
    @album = Album.find_by(id: params[:album_id])
    @track = @album.tracks.build(track_params)
    if params[:add_and_submit]
      @track.update(status: 'submitted')
      redirect_to album_path(@album)
    else
      redirect_to album_path(@album) if @track.save
    end
  end

  def edit; end

  def update
    if params[:add_and_submit]
      @track.update(status: 'submitted')
      redirect_to album_path(@album)
    else
      redirect_to album_path(@album) if @track.update(track_params)
    end  
  end

  def destroy
    redirect_to album_path(@album) if @track.destroy
  end

  private

  def track_params
    params.require(:track).permit(:title, :song, :status)
  end

  def find_album
    @album = Album.find_by(id: params[:album_id])
  end

  def find_track
    @track = Track.find(params[:id])
  end
end
