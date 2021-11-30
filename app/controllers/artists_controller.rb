class ArtistsController < ApplicationController
  before_action :setup_profile
  before_action :verify_artist_user

  def index; end

  private

  def setup_profile
    return if current_user.artist_detail&.valid?

    redirect_to new_user_artist_detail_path(current_user), notice: 'You must setup your profile to continue'
  end
end
