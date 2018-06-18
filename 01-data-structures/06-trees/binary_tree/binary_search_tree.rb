require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating && !root.right
      root.right = node
    elsif root.rating < node.rating && root.right
      insert(root.right, node)
    elsif root.rating > node.rating && !root.left
      root.left = node
    elsif root.rating > node.rating && root.left
      insert(root.left, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if !root || data === nil
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
    return nil if data === nil
    if root.left && root.left.title === data
      root.left = nil
    elsif root.right && root.right.title === data
      root.right = nil
    elsif find(root.left, data)
      delete(root.left, data)
    elsif find(root.right, data)
      delete(root.right, data)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}" 
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

end
