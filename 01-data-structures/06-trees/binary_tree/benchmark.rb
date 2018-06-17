require 'benchmark'
require_relative 'binary_search_tree'
require_relative '../min_binary_heap/min_binary_heap'

n = 10000
a = []

for i in 0..n-1 do
  a[i] = Node.new(i, i)
  #puts a[i].rating
end
bst = BinarySearchTree.new(a[0])
mbh = MinBinaryHeap.new(a[0])
Benchmark.bm do |x|
  x.report("Binary Search Tree") { for i in 1..n-1; bst.insert(a[0],a[i]); end }
end

Benchmark.bm do |y|
  y.report("Binary Search Tree:") { bst.find(a[0],5000)}
end

Benchmark.bm do |z|
  z.report("Binary Search Tree:") { bst.delete(a[0],5000)}
  z.report("Binary Search Tree:") { bst.delete(a[0],9999)}
  z.report("Binary Search Tree:") { bst.delete(a[0],3000)}
end



Benchmark.bm do |x|
  x.report("Min Binary Heap") { for i in 1..n-1; mbh.insert(a[0],a[i]); end }
end

Benchmark.bm do |y|
  y.report("Min Binary Heap:") { mbh.find(a[0],5000)}
end

Benchmark.bm do |z|
  z.report("Min Binary Heap:") { mbh.delete(a[0],5000)}
  z.report("Min Binary Heap:") { mbh.delete(a[0],9999)}
  z.report("Min Binary Heap:") { mbh.delete(a[0],3000)}
end
