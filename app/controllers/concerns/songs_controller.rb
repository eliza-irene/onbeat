class SongsController < ApplicationController
  # before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = current_user.playlists
    if params[:min_tempo] && params[:max_tempo] && params[:style] && params[:mood]
      @results = Song.party(params[:min_tempo], params[:max_tempo], params[:style], params[:mood])
    else
      @results = nil
    end
  end

  def create
    @playlists = current_user.playlists.find(song_params[:playlist_id])
    @song = @playlists.songs.build(song_params)
    # Bonus: Put this bpm stuff into the model
    min_tempo = params[:song][:min_tempo].to_i
    max_tempo = params[:song][:max_tempo].to_i
    bpm = (min_tempo + max_tempo)/2
    @song.bpm = bpm
    if @song.save
      redirect_to songs_path, notice: "You successfully added a song"
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
    params.require(:song).permit(:name, :artist, :min_tempo, :max_tempo, :playlist_id) # Can add playlist_id
  end
end