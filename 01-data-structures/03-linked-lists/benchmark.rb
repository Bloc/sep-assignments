require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000

# Compare the time it takes to create a 10,000 item Array 
# to appending 10,000 items to a Linked List.

llist = LinkedList.new
arr = Array.new
puts "\n10k Array vs LinkedList"
Benchmark.bm do |x|
  x.report("LinkedList:") { for i in 1..n; llist.add_to_tail(Node.new("Test")); end }
  x.report("Array:     ") { n.times do   ; arr << "Test" ; end }
end

# Compare the time it takes to access the 5000th element 
# of the Array and the 5000th Node in the Linked List.

arr = Array.new
llist = LinkedList.new
for i in 0..n
  if i === 5000
    node = Node.new("Select")
    llist.add_to_tail(node)
    arr << "Select"
  else
    llist.add_to_tail(Node.new("Test"))
    arr << "Test"
  end
end

puts "\nAccess 5000th in Array vs Linklist"

Benchmark.bm do |x|
  x.report("LinkedList:") { puts llist.print_at(5000) }
  x.report("Array:     ") { puts arr[5000] }
end

# Compare the time it takes to remove the 5000th element 
# from the Array to removing the 5000th Node in the Linked List.
# In the Array, the 5001st item becomes the 5000th, and so on.

arr = Array.new
llist = LinkedList.new
for i in 0..n
  if i === 5000
    node = Node.new("Delete")
    llist.add_to_tail(node)
    arr << "Delete"
  else
    llist.add_to_tail(Node.new("Test"))
    arr << "Test"
  end
end

puts "\nRemove 5000th in Array vs Linklist"

Benchmark.bm do |x|
  x.report("LinkedList:") { llist.delete(node) }
  x.report("Array:     ") { arr.delete_at(5000) }
end