require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    @target = nil
  end

  def insert(root, node)
    if node.rating < root.rating
      root.left ? self.insert(root.left, node) : root.left = node
    elsif node.rating > root.rating
      root.right ? self.insert(root.right, node) : root.right = node
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return unless root && data   
    if root.title != data
      target ||= self.find(root.right, data)
      return target if target
      target ||= self.find(root.left, data)
    else
      return root
    end
  end

  def delete(root, data)
    target = self.find(root, data)
    return unless root && data
    if target.rating < root.rating
      root.left = self.delete(root.left, data)
    elsif target.rating > root.rating
      root.right = self.delete(root.right, data)
    else
      # if target is leaf node
      if root.left.nil? && root.right.nil?
        root = nil
      # if target has one child
      elsif root.left.nil?
        root = root.right
      elsif root.right.nil?
        root = root.left
      # if target has two children
      else
        temp = self.find_min(root.right)
        root = temp
        root.right = self.delete(root.right,temp.title)
      end
    end
    return root
  end

  def find_min(root)
    while root.left
      root = root.left
    end
    root
  end

  def height(root)
    return 0 unless root
    lheight = self.height(root.left)
    rheight = self.height(root.right)
    lheight > rheight ? lheight + 1 : rheight + 1
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    h = height(@root) + 1
    root = @root
    h.times do |i|
      self.print_level(root, i)
    end
  end

  def print_level(root, level)
    return unless root
    if level == 1
      puts "#{root.title}: #{root.rating}"
    elsif level > 1
      self.print_level(root.left, level-1)
      self.print_level(root.right, level-1)
    end
  end
end