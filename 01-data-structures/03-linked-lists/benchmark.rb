require 'benchmark'
require_relative 'node'
require_relative 'linked_list'


Benchmark.bm do |x|
    count = 10_000

    x.report("C-ar") {
        @ar = []
        count.times do
            @ar.push([*"a".."z"].sample)
        end
    }
    x.report("C-ll") {
        @ll = LinkedList.new
        count.times do
            n = Node.new([*"a".."z"].sample)
            @ll.add_to_tail(n)
        end
    }
    x.report("R-ar") {
        count.times do
            @ar[(count/2)]
        end
    }
    x.report("R-ll") {
        count.times do
            i = @ll.head
            (count/2).times do
                i = i.next
                i
            end
        end
    }
    x.report("D-ar") {
        count.times do
            @ar.delete_at(count/2)
        end
    }
    x.report("D-ll") {
        count.times do
            i = @ll.head
            (count/2).times do
                if i.next && i.next.next
                i.next = i.next.next
                end
            end
        end
    }
end