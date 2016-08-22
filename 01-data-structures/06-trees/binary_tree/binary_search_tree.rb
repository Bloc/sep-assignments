require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating > root.rating
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
    else
      if root.left.nil?
        root.left = node
      else
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.rating == data
      return root
    elsif root.rating == data
      return root.right
    elsif root.left == data
      return root.left
    else
      if data > root.rating
        self.find(root.right, data)
      else
        self.find(root.left, data)
      end
    end
  end

  def delete(root, data)
    target_node = find (root, data)
    if target_node.left.nil? && target_node.right.nil?
      target_node = nil
    else
       
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
