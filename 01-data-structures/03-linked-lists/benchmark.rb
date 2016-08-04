require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

my_ll = LinkedList.new
n = 10000
m = 5000

puts Benchmark.measure { (1..n).map { |i| i } }

Benchmark.bmbm do |x|
	x.report("array") { (1..n).map { |i| i } }
	x.report("linked list") { (1..n).each { |i| my_ll.add_to_tail(Node.new(i)) } }
end

my_array 	= (1..n).map { |i| i }
(1..n).each { |i| my_ll.add_to_tail(Node.new(i))}

Benchmark.bmbm do |x|
	x.report("array find") { my_array[m]}
	x.report("linklist find") { my_ll.find(5000)}
end

Benchmark.bmbm do |x|
	x.report("array del") { my_array.delete_at(m) }
	x.report("linklist del") { my_ll.delete(my_ll.find(5000)) }
end