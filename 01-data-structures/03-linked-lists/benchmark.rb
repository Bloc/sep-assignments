require 'benchmark'

require_relative 'linked_list'

# create an array of n length
def create_array(n)
  test_array = []
  n.times do
    test_array.push("a")
  end
  return test_array
end

# create a linked list of n length
def create_linked_list(n)
  list = LinkedList.new
  a = Node.new("a")
  n.times do
    list.add_to_tail(a)
  end
  return list
end

test_array = create_array(5000)
test_list = create_linked_list(5000)

puts '***create list/array with 10,000 items***'

Benchmark.bm do |x|
  x.report("array      ") {create_array(10_000)}
  x.report("linked list") {create_linked_list(10_000)}
end

puts '***access 5000th element***'

Benchmark.bm do |x|
  x.report("array      ") {test_array.last}
  x.report("linked list") {test_list.tail}
end

puts '***remove 5000th element***'

Benchmark.bm do |x|
  x.report("array      ") {test_array.pop}
  x.report("linked list") {test_list.remove_tail}
end
