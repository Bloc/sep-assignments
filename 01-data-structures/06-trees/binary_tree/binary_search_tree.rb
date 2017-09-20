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
    return nil if (root.nil? || data.nil?)

    if root.title.eql?(data)
      return root
    elsif !root.left.nil?
      find(root.left, data)
    elsif !root.right.nil?
      find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if (root.nil? || data.nil?)
    remove = find(root, data)
    remove.title, remove.rating = nil, nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

end
