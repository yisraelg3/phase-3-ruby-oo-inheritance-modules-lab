require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super
    @songs = []
  end
  
  extend Findable

  def self.all
    @@artists
  end

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  include Paramable
end
