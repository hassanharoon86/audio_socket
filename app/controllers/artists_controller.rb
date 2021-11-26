class ArtistsController < ApplicationController
  before_action :setup_profile

  def index; end

  def new; end

  private

  def setup_profile
    if !(current_user.artist_detail && current_user.artist_detail.valid?)
      redirect_to new_user_artist_detail_path(current_user), notice: 'You must setup your profile to continue'
    end
  end
end
