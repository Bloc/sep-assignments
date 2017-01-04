class Node
  include Comparable

  attr_reader :title
  attr_reader :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def <=> other
    self.rating <=> other.rating
  end

  def to_s
    "#@title: #@rating"
  end
end
