require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
array = []
l_list = LinkedList.new

#user = user CPU time
#system = system CPU time
#total = the sum of the user and system CPU times
#real = elapsed real time

Benchmark.bm(10) do |add|

  add.report("array add") do
    #run the report ("ROW NAME") do
    for i in 1..n do
      array[i] = i
    end
  end

  add.report("linked l_list add") do
    for i in 1..n do
      node = Node.new(i)
      l_list.add_to_tail(node)
    end
  end
end

Benchmark.bm(10) do |x|

  x.report("array find") do
    target = array[5000]
  end

  x.report("linked l_list find") do
    target = l_list.tail
  end
end
#
Benchmark.bm(10) do |pop|

  pop.report("array pop") do
    array.pop
  end

  pop.report("linked l_list pop") do
    l_list.remove_tail
  end
end

Benchmark.bm(10) do |shift|

  shift.report("array shift") do
    array.shift
  end

  shift.report("linked l_list shift") do
    l_list.remove_front()
  end
end