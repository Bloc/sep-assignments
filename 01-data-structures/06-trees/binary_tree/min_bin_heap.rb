require_relative "node"
require "benchmark"

class MinBinHeap
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      old_root = root
      @root = node
      node = old_root
      insert(@root, node)
    else
      if root.left.nil?
        root.left = node
      elsif root.right.nil? && root.left != nil
        root.right = node
      elsif root.left != nil &&
        root.right != nil &&
        root.left.left != nil &&
        root.left.right != nil
        insert(root.right, node)
      elsif root.left != nil && root.right != nil
        insert(root.left, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    # if data is nil
    if data == nil
      return nil
    end

    if root.title == data
      return root
    end

    found_node = nil

    unless root.left.nil?
      found_node = find(root.left, data)
    end

    unless found_node || root.right.nil?
      found_node = find(root.right, data)
    end

    return found_node
  end

  # #delete a node given it's title
  def delete(root, data)
  if root.nil? || data.nil?
    return nil
  else
    target_node = find(root, data)
    target_node.nil? ? nil : (target_node.title = nil && target_node.rating = nil)
  end
end

  def printf()
    #node object array
    children = []
    #info array
    arr = []
    arr.push("#{@root.title}: #{@root.rating}")
    if @root.left != nil
      children.push(@root.left)
    end
    if @root.right != nil
      children.push(@root.right)
    end

    # adds nodes to children array AND pushes data to arr
    children.each do |node|
      if node.left != nil
        children.push(node.left)
      end
      if node.right != nil
        children.push(node.right)
      end
      arr.push("#{node.title}: #{node.rating}")
    end

    puts arr
  end
end

basketball = Node.new("Love and Basketball", 10)
sniper = Node.new("American Sniper", 20)
out = Node.new("In and Out", 30)
matrix =Node.new("The Matrix", 40)
rings = Node.new("Lord of the Rings", 50)
jam = Node.new("Space Jam", 60)
dance =Node.new("Save the last Dance", 70)
day = Node.new("Training Day", 80)
best = Node.new("The Best Man", 90)
love = Node.new("Love Jones", 99)

min_heap = MinBinHeap.new(basketball)

  min_heap.insert(basketball, sniper)
  min_heap.insert(basketball, out)
  min_heap.insert(basketball, matrix)
  min_heap.insert(basketball,rings)
  min_heap.insert(basketball, jam )
  min_heap.insert(basketball, dance)
  min_heap.insert(basketball, day)
  min_heap.insert(basketball, best)
  min_heap.insert(basketball, love )

  min_heap.printf

"=================="

  array_of_numbers = (2..100000).to_a.shuffle
  array_of_nodes = []
  root_node = Node.new("Root Node", 1 )
  heap_tree = MinBinHeap.new(root_node)

  array_of_numbers.each do |i|
    array_of_nodes.push(Node.new("Title #{i}", i))
  end

Benchmark.bm(7) do |x|
  x.report("insert") do
    array_of_nodes.each do |n|
    heap_tree.insert(root_node, n)
    end
  end

  x.report("find") do
    heap_tree.find(root_node, "Title 5")
  end

  x.report("delete") do
    heap_tree.delete(root_node, "Title 50000")
  end
end
