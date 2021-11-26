class TracksController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
  end

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.build
  end

  def create
    @album = Album.find(params[:album_id])
    @track = @album.tracks.build(track_params)
    @track.is_submitted = params[:is_submitted]
    if !@track.save
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:album_id])
    @track = Track.find(params[:id])
    if !@track.is_submitted == true
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @album = Album.find(params[:album_id])
    @track = Track.find(params[:id])
    if !@track.is_submitted == true
      @track.is_submitted = params[:is_submitted]
      if !@track.update(track_params)
        render 'edit'
      end
    end
    byebug
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
  end

  private

  def track_params
    params.require(:track).permit(:title, :track)
  end
end
