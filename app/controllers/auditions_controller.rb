# frozen_string_literal: true

# Auditions_controller
class AuditionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  protect_from_forgery except: :show

  # GET audition/index
  #
  def index # rubocop:disable Metrics/MethodLength
    result = AuditionStatus.call(
      status: params[:status],
      search: params[:search],
      sort_column: sort_column,
      sort_direction: sort_direction
    )
    @auditions = result.auditions
    respond_to do |format|
      format.html
      format.csv { send_data @auditions.to_csv, filename: "auditions-#{Date.today}.csv" }
    end
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
  def update
    @audition = Audition.find(params[:id])
    @audition.update(audition_params)
    case @audition.status
    when 'accepted'
      UserMailer.acceptance_email(@audition).deliver_now
    when 'rejected'
      UserMailer.rejection_email(@audition).deliver_now
    end
    redirect_to auditions_path
  end

  # DELETE audition/destroy/:id
  #
  def destroy; end

  private

  def audition_params
    params.require(:audition).permit(:first_name, :last_name, :artist_name, :email, :genre, :hear_about_us,
                                     :additional_info, :status, songs_attributes: [:link])
  end

  def sort_column
    params[:sort] || ' first_name '
  end

  def sort_direction
    params[:direction] || ' asc '
  end
end
