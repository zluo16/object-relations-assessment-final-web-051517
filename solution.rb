class Viewer

  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    self.class.all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find{|v| v.full_name == name}
  end

  def create_rating(score, movie)
    input = {score: score, movie: movie, user: self}
    Rating.new(input)
  end

end

class Rating

  attr_accessor :score
  attr_reader :movie, :viewer

  @@all = []

  def initialize(hash)
    @score = hash[:score]
    @movie = hash[:movie]
    @viewer = hash[:user]
    self.class.all << self
  end

  def self.all
    @@all
  end

end

class Movie

  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    @@all.find{|m| m.title == title}
  end

  def ratings
    r = Rating.all.find_all{|r| r.movie == self.title}
    r.map{|r| r.score}
  end

  def average_rating
    ratings.inject(0){|sum, x| sum + x} / ratings.length
  end

end
