class Song
    attr_accessor :name, :artist

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename) #"Michael Jackson - Black or White - pop.mp3"
        file = filename.split(" - ")
        newSongName = self.new(file[1]) #<Song:0x0000556de71ae960 @name="Black or White">
        newArtistName = (file[0]) #"Michael Jackson"
        newSongName.artist_name=(newArtistName)     
        return newSongName           
    end

    def artist_name=(artistnameToInstance) #"Michael Jackson"
        temp = Artist.find_or_create_by_name(artistnameToInstance) 
        temp.add_song(self) #is an instance of Artist class!
    end
end