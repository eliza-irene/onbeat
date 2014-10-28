class PlaylistsController < ApplicationController
  before_action :signed_in_user

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

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update_attributes(playlist_params)
      redirect_to playlist_path(@playlist.id), notice: "You have updated your playlist!"
    else
      render 'edit'
    end
  end

  def index 
    @playlists = current_user.playlists
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path, notice: "You have deleted your playlist!"  
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name) 
    end

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

end