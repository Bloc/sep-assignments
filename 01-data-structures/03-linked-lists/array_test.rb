require 'benchmark'
require_relative 'linked_list'

n = 10000

arr = nil
lis = nil
Benchmark.bm(7) do |x|
  x.report("create array:")   { arr = Array.new(n, "placeholder") }
  x.report("create linked-list:") do
      lis = LinkedList.new
      n.times do
          node = Node.new("placeholder")
          lis.add_to_tail(node)
      end
  end
end
  
#  Output
#  
#                        user     system      total        real
# create array:        0.000000   0.000000   0.000000 (  0.000046)
# create linked-list:  0.010000   0.000000   0.010000 (  0.004889)

n = 5000
el1 = nil
el2 = nil
Benchmark.bm(7) do |x|
  x.report("access element in array:")   { el1 = arr[n] }
  x.report("access element in linked-list:") do
      current = lis.head
      n.times do
          current = current.next
      end
      el2 = current
    end
end


# Output
#                                    user     system      total        real
# access element in array:        0.000000   0.000000   0.000000 (  0.000001)
# access element in linked-list:  0.000000   0.000000   0.000000 (  0.000263)


Benchmark.bm(7) do |x|
  x.report("remove element in array:")   { arr.delete_at(5000) }
  x.report("remove element in linked-list:") do
      lis.delete(el2)
    end
end

# Output
#                                     user     system      total        real
# remove element in array:        0.000000   0.000000   0.000000 (  0.000007)
# remove element in linked-list:  0.000000   0.000000   0.000000 (  0.109955)