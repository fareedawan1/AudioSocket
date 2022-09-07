# frozen_string_literal: true

# Auditions_controller
class AuditionsController < ApplicationController
  # GET audition/index
  #
  def index
    @auditons = Audition.order('created_at DESC')
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
    params.require(:audition).permit(:first_name, :last_name, :artist_name, :email, :genre)
  end
end
