require 'benchmark'
require_relative 'linked_list'

def array(m)
  array = Array.new
  (1..m).each { |n|
    node = Node.new(n)
    array.push(node)
  }
  array
end

def linked(m)
  list = LinkedList.new
  (1..m).each { |n|
    node = Node.new(n)
    list.add_to_tail(node)
  }
  list
end

Benchmark.bm do |x|
  x.report("create array") { array(10000) }
  x.report("create linked list") { linked(10000) }
end

array = array(5000)
linked = linked(5000)

Benchmark.bm do |x|
  x.report("access array") { array.last }
  x.report("access linked list") { linked.tail }
end

Benchmark.bm do |x|
  x.report("remove array") { array.pop }
  x.report("remove linked list") { linked.remove_tail }
end
