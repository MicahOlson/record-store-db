class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(attrs)
    @name = attrs[:name]
    @id = attrs[:id]
  end

  def ==(artist_to_compare)
    (self.name == artist_to_compare.name) && (self.id == artist_to_compare.id)
  end

  def self.all
    returned_artists = DB.exec("SELECT * FROM artists;")
    artists = []
    returned_artists.each do |artist|
      name = artist["name"]
      id = artist["id"].to_i
      artists.push(Artist.new({name: name, id: id}))
    end
    artists
  end

  def save 
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

  def self.find(id)
    artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
    if artist
      name = artist["name"]
      id = artist["id"].to_i
      Artist.new({name: name, id: id})
    else
      nil
    end
  end

  def update(attrs)
    if attrs[:name]
      @name = attrs[:name]
      DB.exec("UPDATE artists SET name = '#{@name}' WHERE id = #{@id};")
    elsif attrs[:album_name]
      album_name = attrs[:album_name]
      album = DB.exec("SELECT * FROM albums WHERE lower(name)='#{album_name.downcase}';").first
      if album
        DB.exec("INSERT INTO albums_artists (album_id, artist_id) VALUES (#{album['id'].to_i}, #{@id});")
      end
    end
  end

  def delete
    DB.exec("DELETE FROM artists WHERE id = #{@id};")
  end

  def albums
    albums = []
    results = DB.exec("SELECT album_id FROM albums_artists WHERE artist_id = #{@id};")
    results.each do |result|
      album_id = result["album_id"].to_i
      album = DB.exec("SELECT * FROM albums WHERE id = #{album_id};")
      name = album.first["name"]
      albums.push(Album.new({name: name, id: album_id}))
    end
    albums
  end
end
