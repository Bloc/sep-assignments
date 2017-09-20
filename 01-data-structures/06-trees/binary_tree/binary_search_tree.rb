require_relative 'node'

class BinarySearchTree

  def initialize(root)
    self.root = root

  end

  def insert(root, node)
    if root.rating < node.rating
      (root.right.nil?) ? root.right = node : insert(root.right, node)
    else
      (root.left.nil?) ? root.left = node : insert(root.left, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

end
