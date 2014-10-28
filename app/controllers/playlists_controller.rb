class PlaylistsController < ApplicationController

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to task_path(@playlist.id), notice: "You have created a new playlist!"
    else
      render 'new'
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def index 
    @playlist = current_user.playlists
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name) 
    end

end