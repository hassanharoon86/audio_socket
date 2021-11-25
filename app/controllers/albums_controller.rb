class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_artist_user

  def index; end

  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(album_params)
    @album.save
  end

  def edit
    if @album.tracks.exists?(is_submitted: true)
      @album = current_user.albums.find(params[:id])
    end
  end

  def update
    if @album.tracks.exists?(is_submitted: true)
      @album = current_user.albums.find(params[:id])
      @album.update(album_params)
      @albums = current_user.albums
    end
  end

  def destroy
    if @album.tracks.exists?(is_submitted: true)
      @album = current_user.albums.find(params[:id])
      @album.destroy
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :artwork)
  end

  def verify_artist_user
    if !current_user.artist?
      redirect_to root_path
    end
  end
end
