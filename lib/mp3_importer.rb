class MP3Importer
    attr_accessor :path, :song

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.glob("#{@path}/*.mp3")
        files.collect do |filename|
           filename = filename.to_s.delete_prefix("./spec/fixtures/mp3s/")
           filename
        end
    end

    def import
        self.files.each {|filename| Song.new_by_filename(filename)}
    end



end