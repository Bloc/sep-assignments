require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

array = []
list = LinkedList.new

p "Array Creation"
puts Benchmark.measure {
  array = []
  (0...10000).each do |x|
    array[x] = Node.new(x)
  end
}

p "Node Creation"
puts Benchmark.measure {
  (0...10000).each do |x|
    list.add_to_tail(Node.new(x))
  end
}

p "Array Access"
puts Benchmark.measure {
  array[4999]
}

p "Node Access"
puts Benchmark.measure {
  node = list.head
  (1..4999).each do |x|
    node = node.next
  end
}

p "Array Delete"
puts Benchmark.measure {
  array.delete_at(4999)
}

p "Node Delete"
puts Benchmark.measure {
  node = list.head
  (1..4999).each do |x|
    node = node.next
  end
  list.delete(node)
}