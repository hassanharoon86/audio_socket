# frozen_string_literal: true

class AuditionsController < ApplicationController
  before_action :find_audition, except: %i[new create]
  before_action :auditions, only: [:update_status_and_send_invite]
  before_action :status_valid?, only: [:update_status_and_send_invite]
  before_action :manager_valid?, only: [:update_status_and_send_invite]

  def new
    @audition = Audition.new
    @audition.links.build
  end

  def create
    @audition = Audition.new(audition_params)
    if @audition.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  def show_email_modal; end

  def update_status_and_send_invite
    @content = params[:content]

    return unless @audition.send("#{params[:value]}!")

    AuditionMailer.audition_update(@audition, @content).deliver_now if @audition.rejected?
    User.invite!({ email: @audition.email }, nil, { content: @content }) if @audition.accepted?
  end

  def update_assigned_to
    @audition.user = User.find_by_email(params[:assigned_to])
    AuditionMailer.audition_assign(@audition.user.email, @audition).deliver_now if @audition.save
  end

  private

  def manager_valid?
    current_user == @audition.user
  end

  def auditions
    @auditions = Audition.order(:id)
  end

  def status_valid?
    params[:value].to_sym.in?(Audition.statuses.keys)
  end

  def find_audition
    @audition = Audition.find(params[:id])
  end

  def audition_params
    params.require(:audition).permit(
      :first_name,
      :last_name,
      :email,
      :artist_name,
      :hear_about,
      :additional_info,
      :other_source,
      links_attributes: %i[id link _destroy],
      genres: []
    )
  end
end
