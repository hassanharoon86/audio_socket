# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :find_album
  before_action :find_track, except: %i[index new create]
  before_action :verify_artist_user

  def index; end

  def new
    @track = @album.tracks.build
  end

  def create
    @track = @album.tracks.build(track_params)
    render 'new' unless @track.save
  end

  def edit
    return if @track.is_submitted

    respond_to do |format|
      format.js
    end
  end

  def update
    render 'edit' if !@track.is_submitted && !@track.update(track_params)
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
    params.require(:track).permit(:title, :track, :is_submitted)
  end
end
