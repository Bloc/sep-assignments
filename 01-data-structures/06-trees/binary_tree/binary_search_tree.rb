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
    return nil if  data.nil?

    if root.title.eql?(data)
      return root
    elsif !root.left.nil?
      find(root.left, data)
    elsif !root.right.nil?
      find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if data.nil?
    remove = find(root, data)
    remove.title, remove.rating = nil, nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [root] #FIFO
    children = []

    until queue.empty?
      sub_root = queue.slice!(0)

      queue << sub_root.left if !sub_root.left.nil?
      queue << sub_root.right if !sub_root.right.nil?

      children << "#{sub_root.title : sub_root.rating}"
    end

    children.each do |child|
      puts child
    end
  end

end
