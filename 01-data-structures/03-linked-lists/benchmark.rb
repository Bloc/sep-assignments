require_relative 'linked_list'
require 'benchmark'

array = []
linked_list = LinkedList.new

Benchmark.bm do |x|
  x.report("Create an array: ") {
    i = 0
    while i < 10000
      array.push(i)
      i +=1
    end
  }
  x.report("Create a linked list: ") {
    i = 1
    while i < 10001
      linked_list.add_to_tail(Node.new("#{i}"))
      i +=1
    end
  }
  x.report("Access in array : ") {
    array[4999]
  }
  x.report("Access in linked list: ") {
    temp = linked_list.head
    while temp.data != '5000'
      temp = temp.next
    end
    temp
  }
  x.report("Remove in array : ") {
    array.delete_at(4999)
  }
  x.report("Remove in linked list : ") {
    temp = linked_list.head
    while temp.data != '5001'
      if temp.data =='5000'
        linked_list.delete(temp)
        break
      else
        temp = temp.next
      end
    end
  }
end
