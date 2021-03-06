class Song < ActiveRecord::Base
  # Ask Gerry to explain
  attr_accessor :min_tempo, :max_tempo

  belongs_to :playlist

  def self.party(min_tempo, max_tempo, style)
    min_tempo = "100" if style.blank?
    max_tempo = "500" if style.blank? 
    style     = "pop" if style.blank?

    search_url = "http://developer.echonest.com/api/v4/playlist/static?api_key=O7K1WS4SSGDGAJRKE&format=json&results=20&song_min_hotttnesss=0.4&min_tempo=#{min_tempo}&max_tempo=#{max_tempo}&type=artist-description&description=#{style}&bucket=id:spotify-WW&limit=true&bucket=tracks&bucket=audio_summary"

    HTTParty.get search_url
  end
end
