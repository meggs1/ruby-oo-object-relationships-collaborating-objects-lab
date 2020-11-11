require 'pry'
class Artist
    attr_accessor :name
    @@all = []

def initialize(name)
    @name = name
    @@all << self
end

def self.all
    @@all
end

def songs
    Song.all.select {|song| song.artist == self}
end

def add_song(song)
    song.artist = self
end

def self.find(name)
    @@all.find {|a| a.name == name}
end

def self.create(name)
    artist = self.new(name)
    artist
end

def self.find_or_create_by_name(name)
    if self.find(name)
        self.find(name)
    else
        self.create(name)
    end
end

def print_songs
    self.songs.map {|s| puts s.name}
end

end