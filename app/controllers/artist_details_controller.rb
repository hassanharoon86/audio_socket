class ArtistDetailsController < ApplicationController
  def new
    # byebug
    @artist_detail = current_user.artist_detail || current_user.build_artist_detail
    @artist_detail.email = current_user.email
    # byebug
    @artist_detail.artist_name = Audition.find_by_email(current_user.email).artist_name
    @artist_detail.links.build
  end

  def create
    byebug
    @artist_detail = current_user.create_artist_detail(audition_detail_params)
    if @artist_detail.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  # def update
  #   @artist_detail = current_user.artist_detail
  #   @artist_detail.update(audition_detail_params)
  #   if @artist_detail.save
  #     redirect_to root_path
  #   else
  #     render 'edit'
  #   end
  # end

  def edit
    @artist_detail = current_user.artist_detail
  #   byebug
  end

  private

  def audition_detail_params
    # byebug
    params.require(:artist_detail).permit(
      :email,
      :artist_name,
      :country_code,
      :bio,
      :website_link,
      :image,
      links_attributes: [:id, :link, :_destroy],
      social_links: []
    )
  end
end
