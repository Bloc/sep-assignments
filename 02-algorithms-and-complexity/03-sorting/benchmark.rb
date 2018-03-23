require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

#Compare the time it takes to sort an unsorted array
#only quick_sort sorts in place
array = (1..1000).to_a
array.shuffle!

Benchmark.bm(7) do |x|
  x.report("10 bucket_sort: ") { bucket_sort(array, 10) }
  x.report("100 bucket_sort: ") { bucket_sort(array, 100) }
  x.report("1000 bucket_sort: ") { bucket_sort(array, 1000) }
  x.report("heap_sort: ") { asc_heap_sort(array) }
  x.report("quick_sort: ") { quicksort(array, 0, array.length - 1)}
  array.shuffle!
  x.report("array.sort: ") { array.sort! }
end
puts "\n"

# Results from ruby benchmark.rb
#                       user     system      total        real
# 10 bucket_sort:      0.000000   0.000000   0.000000 (  0.002226)
# 100 bucket_sort:     0.000000   0.000000   0.000000 (  0.000731)
# 1000 bucket_sort:    0.000000   0.000000   0.000000 (  0.000905)
# heap_sort:           0.016000   0.000000   0.016000 (  0.004459)
# quicksort:           0.000000   0.000000   0.000000 (  0.001614)
# array.sort:          0.000000   0.000000   0.000000 (  0.000135)

# As expected from the name, quick sort one of the fastest algorithms implemented eventhough I used recursive calls. The speed of bucket_sort is dependent on how many buckets you use. The more buckets the faster the performance, since this leads to sorting buckets with only a few if any items. Which via insertion sort is very efficient when the items are close in range, as they are in this case. But obviously more buckets will require more memory. Heap sort definitley takes the longest of the threee algorithms implemented. Which is not surprising, given that you have to create a heap from the initial array and reheapify the heap each time you remove the root node to add it to the ordered array which will happen a total of n times. I watched a video that showed the heap sort process for a small unsorted array of less that 10 item and it was painful. Clearly, none of my methods were as fast as ruby's array.sort.
