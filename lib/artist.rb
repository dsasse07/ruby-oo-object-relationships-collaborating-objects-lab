require 'pry'
require_relative './song'
require_relative './mp3_importer'

class Artist
    attr_accessor :name

    @@all = []
    def initialize(name_para)
        @name = name_para
        @@all << self
    end

    def self.all
        @@all        
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song_obj)
        song_obj.artist = self
    end

    def self.find_or_create_by_name(name_para)
        Artist.all.find {|artist| artist.name == name_para} || Artist.new(name_para)        
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end
