class ArtistDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_audition

  def new
    @artist_detail = get_artist_detail
    @artist_detail.is_pro = is_param_pro?
    @artist_detail.artist_name = @audition.artist_name
    @artist_detail.links.build
  end

  def create
    @artist_detail = current_user.build_artist_detail(artist_detail_params)
    @artist_detail.artist_name = @audition.artist_name
    if @artist_detail.save
      redirect_to new_charge_path(user_id: current_user.id) and return if is_param_pro?

      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @artist_detail = get_artist_detail
    @artist_detail.assign_attributes(artist_detail_params)
    @artist_detail.is_pro = is_param_done?
    if @artist_detail.save
      redirect_to new_charge_path(user_id: current_user.id) and return if is_param_pro?

      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @artist_detail = get_artist_detail
    if !@artist_detail.is_pro
      @artist_detail.is_pro = is_param_pro?
    end
  end

  private

  def find_audition
    @audition = Audition.find_by(email: current_user.email)
  end

  def is_param_pro?
    params[:is_pro].present? && params[:is_pro] == 'true'
  end

  def is_param_done?
    params[:is_pro].present? && params[:is_pro] == 'done'
  end

  def get_artist_detail
    current_user.artist_detail || current_user.build_artist_detail(email: current_user.email)
  end

  def artist_detail_params
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
