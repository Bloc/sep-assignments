require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    # if the value is less than the root, start by moving left in the tree
    if node.rating < current_node.rating && !current_node.left
      return current_node.left = node
    else
      while current_node.left
        if node.rating < current_node.left.rating && !current_node.left.left
          return current_node.left.left = node
        elsif node.rating > current_node.left.rating && !current_node.left.right
          return current_node.left.right = node
        else
          current_node = current_node.left
        end
      end
    end
    # if the value is greater than the root, start by moving right in the tree
    if node.rating > current_node.rating && !current_node.right
      current_node.right = node
    else
      while current_node.right
        if node.rating > current_node.right.rating && !current_node.right.right
          current_node.right.right = node
        elsif node.rating < current_node.right.rating && !current_node.right.left
            current_node.right.left = node
        else
          current_node = current_node.right
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if !root
    return root if root.title === data
    if root.left && root.left.title === data
      return root.left
    elsif root.right && root.right.title === data
      return root.right
    elsif find(root.left, data)
      return find(root.left, data)
    elsif find(root.right, data)
      return find(root.right, data)
    end
  end

  def delete(root, data)

  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

end
