class Node
  attr_accessor :title, :rating, :left, :right, :up, :looking_for

  def initialize(title, rating)
    @title = title
    @rating = rating
  end
end