class ArtistDetailsController < ApplicationController
  def new
    @artist_detail = ArtistDetail.new
  end
end
