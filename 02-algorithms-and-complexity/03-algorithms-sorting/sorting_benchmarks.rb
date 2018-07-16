require 'benchmark'
require_relative 'bubble_sort'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'selection_sort'

collection = (1..5000).to_a.shuffle!

puts "Total time to bubble sort 5,000 elements"
puts Benchmark.measure {
  bubble_sort(collection)
}

puts ""

puts "Total time to bucket sort 5,000 elements"
puts Benchmark.measure {
  bucket_sort(collection)
}

puts ""

puts "Total time to heap sort 5,000 elements"
puts Benchmark.measure {
  heap_sort(collection)
}

puts ""

puts "Total time to insertion sort 5,000 elements"
puts Benchmark.measure {
  insertion_sort(collection)
}

puts ""

puts "Total time to merge sort 5,000 elements"
puts Benchmark.measure {
  merge_sort(collection)
}

puts ""

puts "Total time to quick sort 5,000 elements"
puts Benchmark.measure {
  quick_sort(collection, 0, collection.length - 1)
}

puts ""

puts "Total time to selection sort 5,000 elements"
puts Benchmark.measure {
  selection_sort(collection)
}
