class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_artist_user
  before_action :find_album, except: [:new, :create, :index]

  def index; end

  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(album_params)
    @album.save
    respond_to do |format|
      format.js
    end
  end

  def edit; end

  def update
    if !@album.tracks.exists?(is_submitted: true)
      @album.update(album_params)
      @albums = current_user.albums
    end
  end

  def destroy
    @album = current_user.albums.find(params[:id])
    byebug
    if !@album.tracks.exists?(is_submitted: true)
      byebug
      @album.destroy
    end
  end

  private

  def find_album
    @album = current_user.albums.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artwork)
  end

  def verify_artist_user
    if !current_user.artist?
      redirect_to root_path
    end
  end
end
