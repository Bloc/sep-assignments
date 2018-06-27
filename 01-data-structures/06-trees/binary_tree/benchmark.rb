require 'benchmark'
require_relative 'binary_search_tree'

root = Node.new(1, 1)
tree = BinarySearchTree.new(root)

  a = Array.new
  9999.times do |i|
    number = 2
    node = Node.new(number, number)
    a << node
    number += 1
  end



  puts "Total time to insert 9,999 elements"
  puts Benchmark.measure {
    a.each do |node|
      tree.insert(root, node)
    end
  }

  puts "Time to find 5,000 in the Heap"
  puts Benchmark.measure {
    a.each do |node|
      tree.find(root, 5000)
    end
  }


  puts "Time to delete 10,000 elements"
  puts Benchmark.measure {
    1000.times do
      node_title = rand(1...10000)
      tree.delete(root, node_title)
    end
  }
