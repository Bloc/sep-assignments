require 'benchmark'
require_relative 'min_heap_tree'

n = 10000

tree = MinHeapTree.new
n.times do |i|
    node = Node.new("Node #{i}", i)
    tree.insert(node)
end

Benchmark.bm do |bm|
    bm.report do
        tree = MinHeapTree.new
        n.times do |i|
            node = Node.new("Node #{i}", i)
            tree.insert(node)
        end
    end

    bm.report do
        tree.find("Node 5000")
    end

    bm.report do
        tree.delete("Node 8762")
    end
end