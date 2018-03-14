require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_heap/min_heap_array'

#Compare the time it takes to insert a 10,000 items using binary_search_tree vs min_heap.
root = Node.new("Michael", 10001)
binary_tree = BinarySearchTree.new(root)
min_heap = MinHeap.new

puts "\nInsert 10,000 items in BinarySearchTree vs MinHeap"
Benchmark.bm(7) do |x|
  x.report("binary_tree: ") {
    (0..10000).each do |n|
      binary_tree.insert(root, Node.new("Natalie", n))
    end
  }
  x.report("min_heap: ") {
    (0..10000).each do |n|
      min_heap.insert(Element.new("Natalie", n))
    end
  }
end
puts "\n"

#Compare the time it takes to access the 5000th element
puts "Access the 5000th element"
#create binary_tree
(0..4999).each do |n|
  binary_tree.insert(root, Node.new("Natalie", n))
end
binary_tree.insert(root, Node.new("Madison", 5000))
(5001..10000).each do |n|
  binary_tree.insert(root, Node.new("Natalie", n))
end
#create min_heap
(0..4999).each do |n|
  min_heap.insert(Element.new("Natalie", n))
end
min_heap.insert(Element.new("Madison", 5000))
(5001..10000).each do |n|
  min_heap.insert(Element.new("Natalie", n))
end


Benchmark.bm(7) do |x|
  x.report("binary_tree: ") { binary_tree.find(root, "Madison") }
  x.report("min_heap: ") { min_heap.find("Madison") }
end
puts "\n"

#Compare the time it takes to remove the 5000th element
puts "Delete the 5000th element"
Benchmark.bm(7) do |x|
  x.report("binary_tree: ") { binary_tree.delete(root, "Madison") }
  x.report("min_heap: ") { min_heap.delete("Madison") }
end
puts "\n"
