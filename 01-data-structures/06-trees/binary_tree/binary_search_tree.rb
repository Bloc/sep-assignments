require_relative 'node'
require 'benchmark'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? (root.left = node) : insert(root.left, node)
    else
      root.right.nil? ? (root.right = node) : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil?
      nil
    else
      if root.title == data
        root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    return nil if !data || !root
    node_to_delete = find(root, data)
    parent_of_node = find_parent(root, data)

    if node_to_delete
      delete_node(node_to_delete, parent_of_node)
    end
  end

  def delete_node(node, parent_node)
    if parent_node.left && parent_node.left.title == node.title
      if !has_child(parent_node.left)
        parent_node.left = nil
      end
    elsif parent_node.right && parent_node.right.title == node.title
      if !has_child(parent_node.right)
        parent_node.right = nil
      end
    end
  end

  def find_parent(root, data)
    case
    when root.left && !root.right
      root.left.title == data ? root : find_parent(root.left, data)
    when root.right && !root.left
      root.right.title == data ? root : find_parent(root.right, data)
    when root.right && root.left
      return root if root.left.title == data
      return root if root.right.title == data
    else
      find_parent(root.left, data)
      find_parent(root.right, data)
    end
  end

  def has_child(node)
    if node.left || node.right
      return true
    else
      return false
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children.nil?
      children = [@root]
    end
    next_row = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      next_row.push(child.left) if !child.left.nil?
      next_row.push(child.right) if !child.right.nil?
    end
    if next_row.size == 0
      nil
    else
      printf(next_row)
    end
  end
end
=begin
root = Node.new(1, 1)
n = 2
tree = BinarySearchTree.new(root)
puts Benchmark.measure {
  while n <= 10000
      tree.insert(root, Node.new(n, n))
      n += 1
  end
}
puts Benchmark.measure {
  tree.printf
}    
=end