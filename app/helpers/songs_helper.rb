module SongsHelper
  def min_tempo_selector
    select_tag :min_tempo, options_for_select(min_tempo_options)
  end

  def min_tempo_options
    options = bpm_options
    options.unshift(["select min bpm", " "])
    options.pop
    options
  end

  def max_tempo_selector
    select_tag :max_tempo, options_for_select(max_tempo_options)
  end

  def max_tempo_options
    options = bpm_options
    options.shift
    options.unshift(["select max bpm", " "])
  end

  def bpm_options
    [ ["100", "100"], ["120", "120"], ["140", "140"], ["160", "160"], ["180", "180"],
      ["200", "200"], ["220", "220"], ["240", "240"], ["260", "260"], ["280", "280"],
      ["300", "300"], ["320", "320"], ["340", "340"], ["360", "360"] ]
  end

  def genre_selector
    select_tag :style, options_for_select(genre_options)
  end

  def genre_options
    [ ["select genre", " "], ["80's","80s"], ["90's","90s"], ["Folk","folk"],
      ["Country", "country"], ["Salsa", "salsa"],["Ambient", "ambient"],  ["Hip Hop", "hiphop"],
      ["Punk", "punk"], ["Rap", "rap"], ["Reggae", "reggae"], ["Rock", "rock"] ]
  end

end