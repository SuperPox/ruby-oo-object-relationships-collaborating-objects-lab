class MP3Importer
    attr_accessor :path

    def initialize (path)
        @path = path
    end

    def files
        #pareses files in path, returns array of filenames
        #path = => "./spec/fixtures/mp3s"
        #binding.pry
        #Dir["@path/*.mp3"]
        #Dir.glob([@path]).select { |e| File.file? e}
        #Dir["#{@path}/*.mp3"] 
        #binding.pry
        #File.basename(@path)
        #["./spec/fixtures/mp3s/Thundercat - For Love I Come - dance.mp3",
        arr = Dir["#{@path}/*.mp3"]  
        arr.each do |i| 
            i.gsub!("./spec/fixtures/mp3s/", "")
        end
        arr
    end

    def import
        # @path = "./spec/fixtures/mp3s" = what I want to pass to new_by_filename
        4.times do 
            Song.new_by_filename(@path)
        end
    end
end
