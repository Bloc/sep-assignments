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

end
