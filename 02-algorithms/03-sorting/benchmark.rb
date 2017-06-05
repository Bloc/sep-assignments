require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'



test_array = (1..50).to_a.shuffle!


Benchmark.bm(1000) do |x|
  x.report("bucket sort") do
    bucket_sort(test_array)
  end
  test_array.shuffle
   x.report("heap sort") do
     heap_sort(test_array)
   end
   test_array.shuffle
   x.report("quick sort") do
     quick_sort(test_array)
   end
   test_array.shuffle
end
