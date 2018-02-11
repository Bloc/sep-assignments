require 'benchmark'

require_relative 'node'
require_relative 'linked_list'

let(:llist) { LinkedList.new }


Benchmark.bm(1) do |bm|
  bm.report('linked_list-append 10,000 items   ') {
    (1..10_000).each{|i| llist.add_to_front(i)}
  }
  bm.report('create 10,000 element array  ') {
    arr = Array(1..10_000)
  }
end
