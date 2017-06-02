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
        parent.left ? parent = parent.left : (parent.left = node; return)
      else
        parent.right ? parent = parent.right : (parent.right = node; return)
      end
    end
  end

  # Recursive Depth First Search
  def find(root = @root, data)
    puts "Here" if root.title == data
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
