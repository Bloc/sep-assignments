require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new

a = Node.new("key one", "value one")
b = Node.new("key two", "value two")
c = Node.new("key three", "value three")


list.add_to_tail(a)
list.add_to_tail(b)
list.add_to_tail(c)

puts list.print_nodes

array = Array.new
puts "array before is #{array}"
puts " "

l = list.print_nodes
puts "l is #{l}"
list.print_nodes.each do |n|
  array << n
  puts "key is #{n.key}"
  puts "value is #{n.value}"
end

puts "array after is #{array}"
