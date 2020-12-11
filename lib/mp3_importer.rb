require 'pry'

class MP3Importer
    attr_reader :path
    def initialize(music_path)
        @path = music_path
    end

    def files
        @files ||= Dir["#{self.path}/*.mp3"]
        @files.collect {|file| file.gsub("#{path}/","")}
    end

    def import 
        Song.new_by_filename
            self.files.each {|file| Song.new_by_filename(file) }
    end

end

test_music_path = "./spec/fixtures/mp3s"


0