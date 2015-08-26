require 'csv'
require_relative 'album'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end

  # make each track it's own object
  var = Track.new(track[:album_id], track[:track_id], track[:title], track[:track_number], track[:duration_ms])

  # call summary on the new track object and
  # add it to the album's @tracks instance variable array
  album.tracks << var.summary
  # add the song duration in milliseconds to the album's @duration_ms array
  album.duration_ms << track[:duration_ms].to_f
end

#print out the summary for each album
albums.each do |album|
  album.summary
end
