class Song < ActiveRecord::Base
  belongs_to :playlist

  # validates :name,        presence: true, length: { in: 1..254 }
  # validates :artist,      presence: true, length: { in: 1..254 }
  # validates :mood,        presence: true, length: { in: 1..50 }
  # validates :genre,       presence: true, length: { in: 1..50 }
  # validates :bpm,         presence: true
  # validates :playlist_id, presence: true

  def self.party(min_tempo, max_tempo, style, mood)
    min_tempo ||= "179"
    max_tempo ||= "181"
    style     ||= "pop"
    mood      ||= "2"

    search_url = "http://developer.echonest.com/api/v4/song/search?api_key=O7K1WS4SSGDGAJRKE&format=json&results=10&min_tempo=#{min_tempo}&max_tempo=#{max_tempo}&style=#{style}&mood=#{mood}"

    HTTParty.get search_url
  end
end
