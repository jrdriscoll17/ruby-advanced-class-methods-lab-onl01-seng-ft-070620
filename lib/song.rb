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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    correct_song = nil
    self.all.each{|song| song.name == name ? correct_song = song : false}
    correct_song
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    sorted_names = self.all.sort_by {|song| song.name}
    sorted_names
  end

  def self.new_from_filename(filename)
    song_info = filename.split(/[-.]/)
    song = self.new
    song.name = song_info[1][1..-1]
    song.artist_name = song_info[0][0..-2]
    song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(/[-.]/)
    song = self.new
    song.name = song_info[1][1..-1]
    song.artist_name = song_info[0][0..-2]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
