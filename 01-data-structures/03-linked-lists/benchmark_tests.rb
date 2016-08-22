require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
array = []
list = LinkedList.new

Benchmark.bm(25) do |x|
  x.report("array build") do
    for i in 1..n do
      array[i] = i
    end
  end
  x.report("linked list build") do
    for i in 1..n do
      node = Node.new(i)
      list.add_to_tail(node)
    end
  end
end

Benchmark.bm(25) do |x|
  x.report("array find") do
    target = array[5000]
  end
  x.report("linked list find") do
    target = list.find(5000)
  end
end

Benchmark.bm(25) do |x|
  x.report("array delete") do
    array.delete_at(5000)
  end
  x.report("linked list delete") do
    list.delete_at(5000)
  end
end

Benchmark.bm(25) do |x|
  x.report("array remove front") do
    array.delete_at(0)
  end
  x.report("linked list remove front") do
    list.remove_front()
  end
end
