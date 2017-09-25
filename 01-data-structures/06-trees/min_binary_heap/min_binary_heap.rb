require_relative 'node'

class MinBinaryHeap
  attr_accessor :root

  def initialize
    slef.root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      current_root = root
      root = node
      node = current_root
      insert(root, node)
    elsif root.left.nil?
      root.left = node
    elsif !root.left.nil? && root.right.nil?
      root.right = node
    elsif (!root.left.nil? && !root.right.nil? ) && (!root.left.left.nil? && !root.left.right.nil?)
      insert(root.right, node)
    elsif !root.left.nil? && !root.right.nil?
      insert(root.left, node)
    else
      puts "Ooops. There was an error. Please ensure there are no duplicates and retry."
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
