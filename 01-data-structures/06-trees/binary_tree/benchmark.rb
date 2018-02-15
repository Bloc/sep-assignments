require 'benchmark'
require_relative 'binary_search_tree'
require_relative 'min_binary_heap'


# Benchmark 1 - 100,000
puts "Min Binary Heap tree:"
i = 0
numbers = []
while i <= 100000
  numbers.push(Node.new(i, i))
  i += 1
end

tree = MinBinaryHeap.new(numbers[0])
puts Benchmark.measure {
  numbers.each do |j|
    tree.insert(numbers[0], j)
  end
}

puts Benchmark.measure {
  tree.find(numbers[0], 50000)
}

# Benchmark 1 - 100,000
puts "Binary Search tree:"
i = 0
numbers = []
while i <= 10000
  numbers.push(Node.new(i, i))
  i += 1
end

tree = BinarySearchTree.new(numbers[0])
puts Benchmark.measure {
  numbers.each do |j|
    tree.insert(numbers[0], j)
  end
}

puts Benchmark.measure {
  tree.find(numbers[0], 5000)
}
