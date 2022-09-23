# frozen_string_literal: true

# Auditions_controller
class AuditionsController < ApplicationController
  before_action :find_audition, only: %i[update show]
  helper_method :sort_column, :sort_direction
  skip_before_action :verify_authenticity_token, only: [:update]

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
    @user = User.find(params[:user_id])
    @audition = @user.build_audition(audition_params)
    if @audition.save
      redirect_to @audition
    else
      render 'new'
    end
  end

  # GET audition/show/:id
  #
  def show
    @managers = []
    @manager = User.where(type: 'Manager')
    @manager.each do |manager|
      @managers << manager.email
    end
  end

  # GET audition/edit/:id
  #
  def edit; end

  # GET audition/update/:id
  #
  def update # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @user = User.find_by(email: params[:user][:manager]) if params[:user]
    if @user.present?
      @audition.update(manager_id: @user.id, manager_email: @user.email)
      UserMailer.audition_assign(@user).deliver_now
    end
    @audition.update(audition_params) unless audition_params.nil?
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
    if params[:audition]
      params.require(:audition).permit(:first_name, :last_name, :artist_name, :email, :genre, :hear_about_us,
                                       :additional_info, :status, songs_attributes: [:link])
    end
  end

  def find_audition
    @audition = Audition.find(params[:id])
  end

  def sort_column
    params[:sort] || ' first_name '
  end

  def sort_direction
    params[:direction] || ' asc '
  end
end
