class Album

  attr_reader :artists, :tracks, :duration_ms

  def initialize(album_id, album_name, artists)
    @album_id = album_id
    @album_name = album_name
    @artists = artists
    @duration_ms = []
    @tracks = []
  end

  def summary
    puts "\nName: #{title}"
    puts "Artist(s): #{artists}"
    puts "Duration (min.): #{duration_min}"
    puts "Tracks:"
    puts @tracks
  end

  def id
    @album_id
  end

  def title
    @album_name
  end

  #turn millisecond album total into minutes and seconds
  def duration_min
    '%.2f' % ((@duration_ms.inject(:+)/1000)/60)
  end
end



class Track

  def initialize(album_id, id, title, track_number, duration_ms)
    @album_id = album_id
    @id = id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end

  def summary
    "#{@track_number}. #{@title}"
  end

  def album_id
    @album_id
  end

  def id
    @id
  end

  def title
    @title
  end

  def track_number
    @track_number
  end

  def duration_ms
    @duration_ms
  end
end
