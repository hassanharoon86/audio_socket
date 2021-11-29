class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_artist_user
  before_action :find_album, except: [:index, :new, :create]
  before_action :ensure_no_track_submitted, only: [:update, :destroy]

  def index; end

  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(album_params)
    @album.save
  end

  def edit; end

  def update
    @album.update(album_params)
    @albums = current_user.albums
  end

  def destroy
    @album.destroy
  end

  private

  def ensure_no_track_submitted
    return unless @album.tracks.exists?

    redirect_to user_albums_path, notice: "Can't edit/delete this album" if @album.tracks(is_submitted: true)
  end

  def find_album
    @album = current_user.albums.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artwork)
  end

  def verify_artist_user
    redirect_to root_path unless current_user.artist?
  end
end
