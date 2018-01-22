require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

# Compare the performance of an Array to a Linked List using the Benchmark
# module.
# Sample array
array = Array.new(10_000)
# Sample linked list
linked_list = LinkedList.new
10_000.times do |i|
  node = Node.new(i)
  linked_list.add_to_tail(node)
end

# 1.) Compare the time it takes to create a 10,000 item Array to appending
# 10,000 items to a Linked List.
array_measured_times = Benchmark.measure {
  array = Array.new(10_000)
}
puts "Array measured times for creating 10,000 item array"
puts array_measured_times #=>  0.000000   0.000000   0.000000 (  0.000044)


linked_list_measured_times = Benchmark.measure{
10_000.times do |i|
  node = Node.new(i)
  linked_list.add_to_tail(node)
end
}
puts "Linked lists measured times for appending 10,000 nodes to the list"
puts linked_list_measured_times #=>  1.650000   0.000000   1.650000 (  1.652452)

# 2.) Compare the time it takes to access the 5000th element of the Array and the
# 5000th Node in the Linked List.
array_element_measured_times = Benchmark.measure{
  array_element = array[5000]
}
puts "Times to find 5000th element in the array"
puts array_element_measured_times

linked_list_node_measured_times = Benchmark.measure{
  current_node = linked_list.head
  counter = 0
  while counter < 5000 do
    current_node = current_node.next
    counter += 1
  end
}
puts "Times to find the 5000th node on linked list"
puts linked_list_node_measured_times

# 3.) Compare the time it takes to remove the 5000th element from the Array to
# removing the 5000th Node in the Linked List.
array_element_delete_times = Benchmark.measure{
  array.delete_at(5000)
}
puts "Times to delete the 5000th element in the array"
puts array_element_delete_times

linked_list_delete_times = Benchmark.measure{
  current_node = linked_list.head
  counter = 0
  while counter < 5000 do
    current_node = current_node.next
    counter += 1
  end
  linked_list.delete(current_node)
}
puts "Times to delete the 5000th node in the linked list"
puts linked_list_delete_times
