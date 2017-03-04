require 'benchmark'

require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

tree_root = Node.new("tree root", 25000)
heap_root = Node.new("heap root", 25000)
tree = BinarySearchTree.new(tree_root)
heap = MinBinaryHeap.new(heap_root)

n = 100000

Benchmark.bm(20) do |x|
  x.report("tree insert") {
    for i in 1..n do
      new_node = Node.new("tree", Random.rand(100000))
      tree.insert(tree_root, new_node)
    end
  }

  x.report("heap insert") {
    for i in 1..n do
      new_node = Node.new("heap", Random.rand(100000))
      heap.insert(heap_root, new_node)
    end
  }

  x.report("tree find") {
    target = Node.new("target", 50000)
    tree.insert(tree_root, target)
    tree.find(tree_root, target)
  }

  x.report("heap find") {
    target = Node.new("target", 50000)
    heap.insert(heap_root, target)
    heap.find(heap_root, target)
  }

  x.report("tree delete") {
    target = Node.new("target", 75000)
    tree.insert(tree_root, target)
    tree.delete(tree_root, target)
  }

  x.report("heap delete") {
    target = Node.new("target", 75000)
    heap.insert(heap_root, target)
    heap.delete(heap_root, target)
  }

end