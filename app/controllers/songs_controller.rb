class SongsController < ApplicationController
  # before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = current_user.playlists
    if params[:min_tempo] && params[:max_tempo] && params[:style] 
      @results = Song.party(params[:min_tempo], params[:max_tempo], params[:style])
    else
      @results = nil
    end
  end

  def create
    @playlists = current_user.playlists.find(song_params[:playlist_id])
    @song = @playlists.songs.build(song_params)   
    if @song.save
      redirect_to songs_path, notice: "You added a song to your playlist!"
    else
      render 'new'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @playlist = Playlist.find(@song.playlist_id)
    @song.destroy
    redirect_to @playlist, notice: "Song deleted"
  end

  private

  def song_params
    params.require(:song).permit(:name, :artist, :min_tempo, :max_tempo, :bpm, :playlist_id) # Can add playlist_id
  end
end