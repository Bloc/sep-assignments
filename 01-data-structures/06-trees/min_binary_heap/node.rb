class Node
  attr_accessor :title, :rating, :left, :right

  def initialize(title, rating)
    self.title = title
    self.rating = rating
    self.left = nil
    self.right = nil
  end
end
