require "benchmark"
require_relative 'node'
require_relative 'binary_search_tree'


root = Node.new("The Great Debaters", 79)
swat = Node.new("S.W.A.T.", 48)
equalizer = Node.new("The Equalizer", 60)
out = Node.new("Get Out", 99)
ride1 = Node.new("Ride Along", 19)
ride2 = Node.new("Ride Along 2", 14)
think = Node.new("Think Like A Man", 79)
think2 = Node.new("Think Like A Man Too", 53)
love = Node.new("Love And Basketball", 82)
last = Node.new("Transformers: The Last Knight", 15)
moon = Node.new("Transformers: Dark Of The Moon", 35)
trans = Node.new("Transformers", 57)

tree = BinarySearchTree.new(root)

#

Benchmark.bmbm do | x |
  x.report("tree1") { tree.insert(root, equalizer) }
  x.report("tree2") { tree.insert(root, out) }
end
