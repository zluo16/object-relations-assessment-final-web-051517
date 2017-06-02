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
