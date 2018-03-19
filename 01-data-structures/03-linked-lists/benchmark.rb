require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
array = []
llist = LinkedList.new

Benchmark.bm do |x|
  x.report("create 10,000 item array: ") { for i in 1..n; array[i] = i; end }
  x.report("append 10,000 items to linked list: ") { for i in 1..n; llist.add_to_tail(Node.new(i)); end }

  x.report("access 5000th element in array: ") { array[4999] }
  x.report("access 5000th node in linked list: ") {
    node = llist.head
    for i in 1..5000 do
      node = node.next
    end
  }

  x.report("remove 5000th element in array: ") { array.delete_at(4999) }
  x.report("remove 5000th node in linked list: ") {
    node = llist.head
    for i in 1..5000 do
      node = node.next
    end
    llist.delete(node)
  }
end

# practice from http://ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html
# include Benchmark
#
# puts Benchmark.measure { "a"*1_000_000 }
#
# # n = 50000
# # Benchmark.bm do |x|
# #   x.report("for: ") { for i in 1..n; a = "1"; end }
# #   x.report("times: ") { n.times do ; a = "1"; end }
# #   x.report("upto: ") { 1.upto(n) do ; a = "1"; end }
# # end
#
# array = (1..1000000).map { rand }
#
# Benchmark.bmbm do |x|
#   x.report("sort!") { array.dup.sort! }
#   x.report("sort") { array.dup.sort }
# end
#
# n = 50000
# Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
#   tf = x.report("for: ") { for i in 1..n; a = "1"; end }
#   tt = x.report("times: ") { n.times do ; a = "1"; end }
#   tu = x.report("upto: ") { 1.upto(n) do ; a = "1"; end }
#   [tf+tt+tu, (tf+tt+tu)/3]
# end
