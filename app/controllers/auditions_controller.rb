class AuditionsController < ApplicationController
  before_action :find_audition, except: [:new, :create]

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
    @auditions = Audition.all.order(:id)
    @audition = Audition.find(params[:id])
    @content = params[:content]

    if current_user == @audition.user
      @audition.status = Audition.statuses.keys[params[:value].to_i] if params[:value].present?
      if @audition.save
        if @audition.rejected?
          AuditionMailer.audition_update(@audition, @content).deliver_now
        elsif @audition.accepted?
          User.invite!({email: @audition.email}, nil, {content: @content})
        end
      end
    end
  end

  def update_assigned_to
    @audition.user = User.find_by_email(params[:assigned_to])
    if @audition.save
      AuditionMailer.audition_assign(@audition.user.email, @audition).deliver_now
    end
  end

  private

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
      links_attributes: [:id, :link, :_destroy],
      genres: []
    )
  end
end
