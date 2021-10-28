class AuditionsController < ApplicationController
  def new
    @audition = Audition.new
    @links = @audition.links.build
  end

  def create
    @audition = Audition.new(audition_params)
    byebug
    if @audition.save
      redirect_to root_path
    end
  end

  private
  def audition_params
    params.require(:audition).permit(:first_name, :last_name, :email, :artist_name, :genre, :hear_about, :additional_info, :other_source, links_attributes: [:id, :link, :_destroy])

    # params.require(:audition).permit(:first_name, :last_name, :email, :artist_name, :genre, :hear_about, :additional_info, :other_source, links_attributes: %i[id link _destroy])
  end
end
