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
