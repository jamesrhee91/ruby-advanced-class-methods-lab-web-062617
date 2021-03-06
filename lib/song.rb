require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new.save
    self.all.last
  end

  def self.new_by_name(title)
    # song = self.new
    # song.name = title
    # song
    self.new.tap {|song| song.name = title}
  end

  def self.create_by_name(title)
    self.new_by_name(title).save
    self.all.last
  end

  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    check = self.find_by_name(title)
    check == nil ? self.create_by_name(title) : check
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    # file = filename.split(" - ")
    # artist = file.first
    # title = file.last.split(".").first
    # song = self.new_by_name(title)
    # song.artist_name = artist
    # song

    file = filename.split(" - ")
    artist = file.first
    title = file.last.split(".").first
    self.new_by_name(title).tap {|song| song.artist_name = artist}
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
    self.all.last
  end

  def self.destroy_all
    self.all.clear
  end

end

# binding.pry
