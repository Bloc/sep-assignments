require 'benchmark'
require_relative 'linked_list'

n = 10_000_000
node = Node.new("benchmark")
llist = LinkedList.new
Benchmark.bm do |x|
  x.report("Array:") { array = Array.new(n) }
  x.report("LinkedList:") { for i in 1..n; llist.add_to_tail(node); end }
end

array = Array.new(n)
temp_node = llist.head

Benchmark.bm do |y|
  y.report("Array:") { array[5000]}
  y.report("LinkedList:") { for i in 1..5000; temp_node.next; end}
end

Benchmark.bm do |z|
  z.report("Array:") { array.delete_at(5000)}
  z.report("LinkedList:") {
    for i in 1..4999 do
      if i == 4999
         temp_node.next = temp_node.next.next
      end
      temp_node.next
    end  }
end
