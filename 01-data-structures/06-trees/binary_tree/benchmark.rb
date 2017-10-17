require 'benchmark'
require_relative 'binary_search_tree'

n = 10000

root = Node.new('node 4000', 4000)
tree = BinarySearchTree.new(root)
n.times do |i|
    next if i == root.rating
    node = Node.new("Node #{i}", i)
    tree.insert(root, node)
end

Benchmark.bm do |bm|
    bm.report do
        root = Node.new('node 4000', 4000)
        tree = BinarySearchTree.new(root)
        n.times do |i|
            next if i == root.rating
            node = Node.new("Node #{i}", i)
            tree.insert(root, node)
        end
    end

    bm.report do
        tree.find(root, "Node 5000")
    end

    bm.report do
        tree.delete(root, "Node 8762")
    end
end