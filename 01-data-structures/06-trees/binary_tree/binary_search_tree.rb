require_relative 'node'

class BinarySearchTree

  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      if root.right == nil
        root.right = node
      else 
        insert(root.right, node)
      end
    elsif node.rating < root.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    target = nil
    if root.title == data.title
      target = root
    elsif data.rating < root.rating
      find(root.left, data)

    elsif data.rating > root.rating
      find(root.right, data)
    else
      nil
    end
    return target
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
