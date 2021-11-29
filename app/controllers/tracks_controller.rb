class TracksController < ApplicationController
  before_action :find_album, only: [:index, :new, :create]
  before_action :find_track, except: [:index, :new, :create]

  def index; end

  def new
    @track = @album.tracks.build
  end

  def create
    @track = @album.tracks.build(track_params)
    @track.is_submitted = params[:is_submitted]
    if !@track.save
      render 'new'
    end
  end

  def edit
    if !@track.is_submitted == true
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    if !@track.is_submitted == true
      @track.is_submitted = params[:is_submitted]
      if !@track.update(track_params)
        render 'edit'
      end
    end
  end

  def destroy
    @track.destroy
  end

  private

  def find_track
    @track = Track.find(params[:id])
  end

  def find_album
    @album = Album.find(params[:album_id])
  end

  def track_params
    params.require(:track).permit(:title, :track)
  end
end
