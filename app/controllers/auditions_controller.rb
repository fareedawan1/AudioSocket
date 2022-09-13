# frozen_string_literal: true

# Auditions_controller
class AuditionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET audition/index
  #
  def index
    @auditions = Audition.search(params[:search]).order("#{sort_column}  #{sort_direction}")
  end

  # GET audition/new/:id
  #
  def new
    @audition = Audition.new
  end

  # POST audition/create
  #
  def create
    @audition = Audition.new(audition_params)
    if @audition.save
      redirect_to @audition
    else
      render 'new'
    end
  end

  # GET audition/show/:id
  #
  def show
    @audition = Audition.find(params[:id])
  end

  # GET audition/edit/:id
  #
  def edit; end

  # GET audition/update/:id
  #
  def update; end

  # DELETE audition/destroy/:id
  #
  def destroy; end

  private

  def audition_params
    params.require(:audition).permit(:first_name, :last_name, :artist_name, :email, :genre, :hear_about_us,
                                     :additional_info, songs_attributes: [:link])
  end

  def sort_column
    params[:sort] || ' first_name '
  end

  def sort_direction
    params[:direction] || ' asc '
  end
end
