class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    self.title = title
    self.rating = rating
    self.left = nil
    self.right = nil
  end
end
