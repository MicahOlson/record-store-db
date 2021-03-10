require 'spec_helper'

describe '#Album' do
  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new({name: "The Resistance"})
      album2 = Album.new({name: "The Resistance"})
      expect(album).to(eq(album2))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new({name: "The 2nd Law"})
      album.save
      album2 = Album.new({name: "The Resistance"})
      album2.save
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new({name: "The Resistance"})
      album.save
      album2 = Album.new({name: "The 2nd Law"})
      album2.save
      Album.clear
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new({name: "The Resistance"})
      album.save
      album2 = Album.new({name: "The 2nd Law"})
      album2.save
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new({name: "The Resistance"})
      album.save
      album.update("The Resistance")
      expect(album.name).to(eq("The Resistance"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new({name: "The Resistance"})
      album.save
      album2 = Album.new({name: "The 2nd Law"})
      album2.save
      album.delete
      expect(Album.all).to(eq([album2]))
    end
    it("deletes all songs belonging to a deleted album") do
      album = Album.new({name: "The Resistance"})
      album.save
      song = Song.new({track: 1, name: "Uprising", album_id: album.id})
      song.save
      album.delete
      expect(Song.find(song.id)).to(eq(nil))
    end
  end

  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new({name: "The Resistance"})
      album.save
      song = Song.new({track: 1, name: "Uprising", album_id: album.id})
      song.save
      song2 = Song.new({track: 2, name: "Resistance", album_id: album.id})
      song2.save
      expect(album.songs).to(eq([song, song2]))
    end
  end
end
