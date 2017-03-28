require 'benchmark'
require_relative 'node'
require_relative 'min_heap'

prng = Random.new
rand_num = prng.rand(1..100000)

root = Node.new('1', rand)
my_tree = MinHeapTree.new(root)

rand_arr = (2..100000).map { rand }

Benchmark.bm do |x|
	x.report("Push 100,000 items to tree") { 
		(2..100000).each do |i|
			new_node = Node.new(i.to_s, rand)
			my_tree.insert(my_tree.root, new_node)
		end 
	}
	
	x.report("Find 50,000th item in tree") { 
		my_tree.find(my_tree.root, '50000') 
	}

	x.report("Delete 50,000th item in MyArray") { 
		my_tree.delete(my_tree.root, '50000') 
	}
end

