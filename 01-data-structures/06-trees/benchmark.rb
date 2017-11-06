require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'


btree_root = Node.new("tree root", 24)
min_heap_root = Node.new("heap root", 24)
tree = BinarySearchTree.new(btree_root)
heap = MinBinaryHeap.new(min_heap_root)




nums = 100000

Benchmark.bm(25) do |x|
  x.report("tree #insert") do
    for i in 1..nums do
      new_node = Node.new("tree", Random.rand(nums))
      tree.insert(btree_root, new_node)
    end
  end
   x.report("heap #insert") do
     for i in 1..nums do
       new_node = Node.new("heap", Random.rand(nums))
       heap.insert(min_heap_root, new_node)
     end
   end
end

target = Node.new("target", 50000)
tree.insert(btree_root, target)
heap.insert(min_heap_root, target)

Benchmark.bm(25) do |x|
  x.report("tree #find") do
      tree.find(btree_root, 50000)
  end
   x.report("heap #find") do
     heap.find(min_heap_root, 50000)
   end
end

Benchmark.bm(25) do |x|
  x.report("tree #delete") do
      tree.delete(btree_root, 50000)
  end
   x.report("heap #delete") do
     heap.delete(min_heap_root, 50000)
   end
end
