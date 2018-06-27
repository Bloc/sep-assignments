require 'benchmark'
require_relative 'linked_list'

puts '10,000 item Array'
puts Benchmark.measure {
  a = []
  10000.times do |i|
    a << i
  end
}

puts '10,000 node Linked List'
puts Benchmark.measure {
  l = LinkedList.new
  10000.times do |i|
    n = Node.new(i)
    l.add_to_tail(n)
  end
}

array = []
10000.times do |i|
  array << i
end

puts 'Accessing the 5000th element of the Array'
puts Benchmark.measure {
  array.index(4999)
}

list = LinkedList.new
10000.times do |i|
  n = Node.new(i)
  list.add_to_tail(n)
end


puts 'Accessing the 5000th node of the Linked List'
puts Benchmark.measure {
  list.find(4999)
}

puts 'Removing the 5000th element from the Array'
puts Benchmark.measure {
  array.delete_at(4999)
}


puts 'Removing the 5000th node from the List'
puts Benchmark.measure {
  list.delete(4999)
}
