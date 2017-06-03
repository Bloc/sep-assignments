require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def root
    @root
  end

  def insert(root = @root, node)
    parent = root
    while true
      if node.rating < parent.rating
        parent.left ? parent = parent.left : (node.up = parent; parent.left = node; return)
      else
        parent.right ? parent = parent.right : (node.up = parent; parent.right = node; return)
      end
    end
  end

  # Recursive Depth First Search
  def find(root = @root, data)
    finder = @root
    while finder.title != data
      if finder.left && finder.left.looking_for != data
        finder = finder.left
        finder.looking_for = data
      elsif finder.right && finder.right.looking_for != data
        finder = finder.right
        finder.looking_for = data
      elsif finder.up
        finder = finder.up
      else
        return nil
      end
    end
    finder
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
