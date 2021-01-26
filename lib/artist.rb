require 'pry'
class Artist
    attr_accessor :name 



    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all #returns all existing Artist instances
    end

    def songs
        Song.all.select {|song| song.artist == self}  
        ##<Song:0x00005618db355e90 @artist=#<Artist:0x00005618db355f30 @name="Michael Jackson">, @name="Billie Jean">]
        #binding.pry
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name (name_string)
        artist = self.all.find{|object| object.name == name_string}
        if artist == nil  
            artist = Artist.new(name_string)
        else
            artist
        end
    end

    def print_songs    
        arr = []
        arr = self.songs    
        arr.each do |i|
            puts i.name
        end
    end
end