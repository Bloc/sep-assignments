require 'benchmark'

require_relative 'selection_sort.rb'
require_relative 'insertion_sort.rb'
require_relative 'bubble_sort.rb'
require_relative 'merge_sort.rb'
require_relative 'quick_sort.rb'
require_relative 'heap_sort.rb'
require_relative 'bucket_sort.rb'

collection = Array.new(50) { rand(0..100) }
puts collection

Benchmark.bm(20) do |x| 
  x.report("selection") {
    selection_sort(collection)
  }

  x.report("insertion") {
    insertion_sort(collection)
  }

  x.report("bubble") {
    bubble_sort(collection)
  }

  x.report("merge") {
    merge_sort(collection)
  }

  x.report("quick") {
    quick_sort(collection, 0, collection.length-1)
  }

  x.report("heap") {
    heap_sort(collection)
  }

  x.report("bucket") {
    bucket_sort(collection)
  }
end