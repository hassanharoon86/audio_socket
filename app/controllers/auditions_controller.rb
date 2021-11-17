class AuditionsController < ApplicationController
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

  def update_assigned_to
    @audition = Audition.find(params[:audition_id])
    @audition.user = User.find_by_email(params[:assigned_to])
    if @audition.save
      AuditionMailer.audition_assign(@audition.user.email, @audition).deliver_now
    end
  end

  private

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
