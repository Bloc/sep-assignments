require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000

# Compare the time it takes to create a 10,000 item Array to appending 10,000
# items to a Linked List.

Benchmark.bm do |bm|
    # array
    bm.report do
        arr = []
        n.times do
            arr << rand(1000)
        end
    end

    # linked list
    bm.report do
        list = LinkedList.new
        n.times do
            list.add_to_tail(Node.new(rand(1000)))
        end
    end
end

# Compare the time it takes to access the 5000th element of the Array and the
# 5000th Node in the Linked List.

Benchmark.bm do |bm|
    # array
    bm.report do
        arr = []
        n.times do
            arr << rand(1000)
        end
        target = arr[5000]
    end

    # linked list
    bm.report do
        list = LinkedList.new
        n.times do
            list.add_to_tail(Node.new(rand(1000)))
        end
        target = list.head
        5000.times do
            target = target.next
        end
    end
end

# Compare the time it takes to remove the 5000th element from the Array to 
# removing the 5000th Node in the Linked List.

Benchmark.bm do |bm|
    # array
    bm.report do
        arr = []
        n.times do
            arr << rand(1000)
        end
        arr.delete(arr[5000])
    end

    # linked list
    bm.report do
        list = LinkedList.new
        n.times do
            list.add_to_tail(Node.new(rand(1000)))
        end
        target = list.head
        5000.times do
            target = target.next
        end
        list.delete(target)
    end
end