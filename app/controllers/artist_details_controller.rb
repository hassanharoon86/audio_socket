class ArtistDetailsController < ApplicationController
  def new
    @artist_detail = get_artist_detail || current_user.build_artist_detail
    @artist_detail.email = current_user.email
    if is_param_pro
      @artist_detail.is_pro = true
    end
    @artist_detail.artist_name = Audition.find_by_email(current_user.email).artist_name
    @artist_detail.links.build
  end

  def create
    @artist_detail = current_user.build_artist_detail(artist_detail_params)
    @artist_detail.artist_name = Audition.find_by_email(current_user.email).artist_name
    if @artist_detail.save
      if is_param_pro
        redirect_to new_charge_path(user_id: current_user.id)
      else
        redirect_to root_path
      end
    else
      render 'new'
    end
  end

  def update
    @artist_detail = get_artist_detail
    @artist_detail.update(artist_detail_params)
    if params[:is_pro] == 'done'
      @artist_detail.is_pro = true
    end
    if @artist_detail.save && is_param_pro
        redirect_to new_charge_path(user_id: current_user.id)
    elsif @artist_detail.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @artist_detail = get_artist_detail
    if is_param_pro
      @artist_detail.is_pro = true
    end
  end

  private

  def is_param_pro
    params[:is_pro].present? && params[:is_pro] == 'true'
  end

  def get_artist_detail
    current_user.artist_detail
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
