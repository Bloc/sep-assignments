require 'benchmark'
require_relative 'heap/node'
require_relative 'binary_tree/node'
require_relative 'binary_tree/binary_search_tree'
require_relative 'heap/heap'

arr = []
(1..10000).each do |x|
  arr.push(x)
end
shuff_arr = arr.shuffle

puts "inserting heap"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  heap = Heap.new(root)
  (1...shuff_arr.size-1).each do |x|
    root = heap.root
    heap.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
}
puts "searching element 5000 in heap"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  heap = Heap.new(root)
  (1...shuff_arr.size-1).each do |x|
    root = heap.root
    heap.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
  heap.find(root, 5000)
}
puts "deleting a node"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  heap = Heap.new(root)
  (1...shuff_arr.size-1).each do |x|
    root = heap.root
    heap.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
  heap.delete(root, 5000)
}




puts "inserting binary search tree"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  tree = BinarySearchTree.new(root)
  (1...shuff_arr.size-1).each do |x|
    tree.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
}

puts "searching element 5000 in binary search tree"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  tree = BinarySearchTree.new(root)
  (1...shuff_arr.size-1).each do |x|
    tree.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
  tree.find(root, 5000)
}
puts "deleting a node"
puts Benchmark.measure {
  root = Node.new(shuff_arr[0], shuff_arr[0])
  tree = BinarySearchTree.new(root)
  (1...shuff_arr.size-1).each do |x|
    tree.insert(root, Node.new(shuff_arr[x], shuff_arr[x]))
  end
  tree.delete(root, 5000)
}
