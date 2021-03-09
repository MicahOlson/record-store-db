class Song
  attr_reader :id
  attr_accessor :track, :name, :album_id

  def initialize(attrs)
    @track = attrs[:track]
    @name = attrs[:name]
    @album_id = attrs[:album_id]
    @id = attrs[:id]
  end

  def ==(song_to_compare)
    if song_to_compare != nil
      (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id())
    else
      false
    end
  end

  def self.all
    returned_songs = DB.exec("SELECT * FROM songs;")
    songs = []
    returned_songs.each() do |song|
      track = song["track"].to_i
      name = song["name"]
      album_id = song["album_id"].to_i
      id = song["id"].to_i
      songs.push(Song.new({track: track, name: name, album_id: album_id, id: id}))
    end
    songs
  end

  def save
    result = DB.exec("INSERT INTO songs (track, name, album_id) VALUES (#{@track}, '#{@name}', #{@album_id}) RETURNING id;")
    @id = result.first["id"].to_i
  end

  def self.find(id)
    song = DB.exec("SELECT * FROM songs WHERE id = #{id};").first
    if song
      track = song["track"].to_i
      name = song["name"]
      album_id = song["album_id"].to_i
      id = song["id"].to_i
      Song.new({track: track, name: name, album_id: album_id, id: id})
    else
      nil
    end
  end

  def update(updates)
    @track = updates[:track]
    @name = updates[:name]
    @album_id = updates[:album_id]
    DB.exec("UPDATE songs SET track = #{@track}, name = '#{@name}', album_id = #{@album_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM songs WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM songs *;")
  end

  def self.find_by_album(alb_id)
    songs = []
    returned_songs = DB.exec("SELECT * FROM songs WHERE album_id = #{alb_id} ORDER BY track;")
    returned_songs.each() do |song|
      track = song["track"].to_i
      name = song["name"]
      id = song["id"].to_i
      songs.push(Song.new({track: track, name: name, album_id: alb_id, id: id}))
    end
    songs
  end

  def album
    Album.find(@album_id)
  end
end
