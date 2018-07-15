require 'benchmark'
require_relative 'linked_list'
require_relative 'node'
include Benchmark

Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  arr = x.report("array:")   {
	  Array.new(10000)
	}
  ll = x.report("linked list:") { 
	  ll = LinkedList.new
	  10000.times {
		  ll.add_to_tail(Node.new(nil))
		}
	}
  [arr+ll, (arr+ll)/2]
end

arr = Array.new(10000)
node_to_delete = nil
ll = LinkedList.new
	 10000.times do |x|
		  ll.add_to_tail(Node.new(nil))
		  if (x == 5000)
			node_to_delete = ll.tail
		  end
	 end

Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  arr = x.report("array:")   {
	  arr[4999]
	}
  ll = x.report("linked list:") { 
	  current_node = ll.head
	  4999.times do |x|
		  next_node = current_node.next
		  current_node = next_node
	  end
	  current_node
	}
  [arr+ll, (arr+ll)/2]
end

Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  arr = x.report("array:")   {
	  arr.delete_at(5000)
	}
  ll = x.report("linked list:") { 
	  ll.delete(node_to_delete)
	}
  [arr+ll, (arr+ll)/2]
end