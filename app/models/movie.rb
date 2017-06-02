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
