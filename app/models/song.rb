class Song < ActiveRecord::Base
  # Ask Gerry to explain
  attr_accessor :min_tempo, :max_tempo

  belongs_to :playlist

  def self.party(min_tempo, max_tempo, style, mood)
    min_tempo ||= "179"
    max_tempo ||= "181"
    style     ||= "pop"
    mood      ||= "2"

    search_url = "http://developer.echonest.com/api/v4/song/search?api_key=O7K1WS4SSGDGAJRKE&format=json&results=10&min_tempo=#{min_tempo}&max_tempo=#{max_tempo}&style=#{style}&mood=#{mood}"

    HTTParty.get search_url
  end
end
