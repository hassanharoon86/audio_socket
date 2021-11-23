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
    @album = current_user.albums.find(params[:id])
  end

  def update
    @album = current_user.albums.find(params[:id])
    @album.update(album_params)
    @albums = current_user.albums
  end

  def destroy
    @album = current_user.albums.find(params[:id])
    @album.destroy
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
