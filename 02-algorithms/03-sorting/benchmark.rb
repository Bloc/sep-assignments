require 'benchmark'

require_relative './bucketsort.rb'
require_relative './heapsort.rb'
require_relative './quicksort.rb'

array = []

for x in 1..50 do
  array << rand(50)
end


puts '***Benchmarks***'

Benchmark.bm do |x|
  x.report("Quick sort") { quicksort(array) }
  x.report("Heap sort") { heapsort(array)  }
  x.report("Bucket sort") { bucketsort(array)  }
end
