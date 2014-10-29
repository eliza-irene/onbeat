class SongsController < ApplicationController
  # before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    if params[:min_tempo] && params[:max_tempo] && params[:style] && params[:mood]
      @results = Song.party(params[:min_tempo], params[:max_tempo], params[:style], params[:mood])
    else
      @results = nil
    end
  end

  private

  def songs_params
  end
end