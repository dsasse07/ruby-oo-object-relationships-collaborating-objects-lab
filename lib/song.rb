require 'pry'

class Song
    @@all = []
    attr_accessor :name, :artist

    def initialize(name_para)
        @@all << self
        @name = name_para
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        song_name = file_name.split(" - ")
        new_artist = Artist.new(song_name[0])
        new_song = Song.new(song_name[1])
        new_song.artist = new_artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end

end