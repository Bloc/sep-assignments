class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent
  
  def initialize(title, rating)
    self.title = title
    self.rating = rating
  end
  
  def set_left(node)
    if node
      node.detach
      node.parent = self
    end
    self.left = node
  end
  
  def set_right(node)
    if node
      node.detach
      node.parent = self
    end
    self.right = node
  end
  
  def detach
    if self.parent == nil
      return
    end
    parent = self.parent
    if parent.left == self
      parent.left = nil
      self.parent = nil
      return
    end
    if parent.right == self
      parent.right = nil
      self.parent = nil
      return
    end
  end

end