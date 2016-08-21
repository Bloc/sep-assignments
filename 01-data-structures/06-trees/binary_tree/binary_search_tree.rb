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
    if root.title == data
      root
    elsif root.right != nil
      find(root.right, data)
    elsif root.left != nil
      find(root.left, data)
    end
  end

  def delete(root, data)
    if !data
      nil
    elsif root.left.title == data
      temp = root.left
      root.left = temp.right
    end

  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
