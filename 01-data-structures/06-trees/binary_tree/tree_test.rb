require 'benchmark'
require_relative 'binary_search_tree'

root = Node.new(0,0)
tree = BinarySearchTree.new(root)

numbers = []
(0...10000).each do |i|
    numbers.push(i)
end

Benchmark.bm(7, "task", "user", "system", "total", "real") do |x|
    x.report("insert") do
        (0...numbers.length).each do |i|
            tree.insert(root, Node.new(i, numbers[i]))
        end
    end
    
    x.report("find") do
        tree.find(root, 5000)
    end
    
    x.report("delete") do
        tree.delete(root, 5000)
    end
end

# RESULTS
#              user     system      total        real
# insert    4.570000   0.000000   4.570000 (  4.577698)
# find      0.000000   0.000000   0.000000 (  0.000787)
# delete    0.000000   0.000000   0.000000 (  0.000776)

#........Shuffled.......

numbers = numbers.shuffle

Benchmark.bm(7, "task", "user", "system", "total", "real") do |x|
    x.report("insert") do
        (0...numbers.length).each do |i|
            tree.insert(root, Node.new(i, numbers[i]))
        end
    end
    
    x.report("find") do
        tree.find(root, 5000)
    end
    
    x.report("delete") do
        tree.delete(root, 5000)
    end
end

# RESULTS
#              user     system      total        real
# insert    3.270000   0.000000   3.270000 (  3.277143)
# find      0.010000   0.000000   0.010000 (  0.002690)
# delete    0.000000   0.000000   0.000000 (  0.001940)