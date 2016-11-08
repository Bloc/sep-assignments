require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

#intalize stuff
tree_root = Node.new("root", 10)
# heap_root = Node.new("the root", 10)
tree = BinarySearchTree.new(tree_root)
# heap = BinarySearchHeap.new()
# heap.insert(nil, heap_root)



n = 100000

Benchmark.bm(25) do |x|
  x.report("tree build") do
    for i in 1..n do
      new_node = Node.new("value", 1 + Random.rand(100000))
      tree.insert(tree_root, new_node)
    end
  end
  # x.report("heap build") do
  #   for i in 1..n do
  #     new_node = Node.new("stuff", Random.rand(100000))
  #     heap.insert(heap_root, new_node)
  #   end
  # end
end

target = Node.new("target", 50000)
tree.insert(tree_root, target)
# heap.insert(heap_root, target)

Benchmark.bm(25) do |x|
  x.report("tree find (50000)") do
      tree.find(tree_root, 50000)
  end
  # x.report("heap find (50000)") do
  #   heap.find(heap_root, 50000)
  # end
end

Benchmark.bm(25) do |x|
  x.report("tree delete") do
      tree.delete(tree_root, 50000)
  end
  # x.report("heap delete") do
  #   heap.delete(heap_root, 50000)
  # end
end
