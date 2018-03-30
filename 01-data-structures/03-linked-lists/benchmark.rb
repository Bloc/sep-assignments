require 'benchmark'
require_relative 'linked_list'

#Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
n = 10000
linked_list = LinkedList.new

puts "\nCreating 10,000 item Array vs 10,000 item Linked List"
Benchmark.bm(7) do |x|
  x.report("array: ") { Array.new(n, "Natalie") }
  x.report("linked list: ") {
    n.times do
      linked_list.add_to_tail(Node.new("Natalie"))
    end
  }
end
puts "\n"

puts "\nCreating 100 item Array vs 100 item Linked List"
Benchmark.bm(7) do |x|
  x.report("array: ") { Array.new(100, "Natalie") }
  x.report("linked list: ") {
    100.times do
      linked_list.add_to_tail(Node.new("Natalie"))
    end
  }
end
puts "\n"

#Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
array = Array.new(n, "Natalie")
4999.times do
  linked_list.add_to_tail(Node.new("Natalie"))
end
linked_list.add_to_tail(Node.new("Madison"))
5000.times do
  linked_list.add_to_tail(Node.new("Michael"))
end

puts "Access the 5000th element"
Benchmark.bm(7) do |x|
  x.report("array: ") { array[4999] }
  x.report("linked list: ") { linked_list.find("Madison") }
end
puts "\n"

#Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
puts "Delete the 5000th element"
Benchmark.bm(7) do |x|
  x.report("array: ") { array.delete_at(4999) }
  x.report("linked list: ") { linked_list.delete(Node.new("Madison")) }
end
puts "\n"

puts "Delete the 5th element"
array2 = Array.new(10, "Madison")
ll2 = LinkedList.new
4.times do
  ll2.add_to_tail(Node.new("Natalie"))
end
ll2.add_to_tail(Node.new("Madison"))
5.times do
  ll2.add_to_tail(Node.new("Michael"))
end
Benchmark.bm(7) do |x|
  x.report("array: ") { array2.delete_at(4) }
  x.report("linked list: ") { ll2.delete(Node.new("Madison")) }
end
puts "\n"

#Compare the time it takes to remove the last element from the Array to removing the last Node in the Linked List.
puts "Delete the last element"
Benchmark.bm(7) do |x|
  x.report("array: ") { array.delete_at(9999) }
  x.report("linked list: ") { linked_list.remove_tail }
end
puts "\n"

#Compare the time it takes to insert an element at the front of the Array to  inserting an element at the front of the Linked List.
puts "Insert element at front"
Benchmark.bm(7) do |x|
  x.report("array: ") { array.unshift("Michael") }
  x.report("linked list: ") { linked_list.add_to_front(Node.new("Michael")) }
end
puts "\n"

#Compare the time it takes to insert an element at the end of the Array to  inserting an element at the tail of the Linked List.
puts "Insert element at end"
Benchmark.bm(7) do |x|
  x.report("array: ") { array.push("Michael") }
  x.report("linked list: ") { linked_list.add_to_tail(Node.new("Michael")) }
end
puts "\n"
