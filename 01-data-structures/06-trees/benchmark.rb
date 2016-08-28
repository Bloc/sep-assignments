require 'benchmark'
require_relative './binary_tree/node'
require_relative './binary_tree/binary_search_tree'
require_relative './heap/node'
require_relative './heap/heap_tree'

a = Node.new(1,1)
bst = BinarySearchTree.new(a)
ht = HeapTree.new(a)

n = 10000

puts Benchmark.measure { 
	(1..n).each do |i|
		b = Node.new(i, i)
		bst.insert(bst.root, b)
	end
}

puts Benchmark.measure { 
	(1..n).each do |i|
		b = Node.new(i, i)
		ht.insert(ht.root, b)
	end
}

Benchmark.bmbm do |x|
	x.report("bst find") { bst.find(bst.root, 5000) }
	x.report("ht find") { ht.find(ht.root, 5000) }
end

Benchmark.bmbm do |x|
	x.report("bst delete 5k") { bst.delete(bst.root, 5000) }
	x.report("ht delete 5k") { ht.delete(ht.root, 5000) }
end

Benchmark.bmbm do |x|
	x.report("bst delete 9990") { bst.delete(bst.root, 9990) }
	x.report("ht delete 9990") { ht.delete(ht.root, 9990) }
end

Benchmark.bmbm do |x|
	x.report("bst delete 500") { bst.delete(bst.root, 500) }
	x.report("ht delete 500") { ht.delete(ht.root, 500) }
end

