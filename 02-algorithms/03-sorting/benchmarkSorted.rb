require 'benchmark'
require_relative 'quickSort'
require_relative 'heapSort'
require_relative 'insertionSort'
require_relative 'selectionSort'
require_relative 'bubbleSort'
require_relative 'bucketSort'
require_relative 'mergeSort'

n = 50
array = ["E", "C", "A", "B", "F", "G", "D"]

#user = user CPU time
#system = system CPU time
#total = the sum of the user and system CPU times
#real = elapsed real time

Benchmark.bm(50) do |x|
  x.report('quick sort:') { quick_sort(array) }
  x.report('heap sort:') { heap_sort(array) }
  x.report('insertion sort:') { insertion_sort(array) }
  x.report('selection sort:') { selection_sort(array) }
  x.report('bubble sort:') { bubble_sort(array) }
  x.report('bucket sort:') { bucket_sort(array) }
  x.report('merge sort:') { merge_sort(array) }
end

# -------------
# Also Worked:
# puts Benchmark.measure {
#   50.times do
#     quick_sort(array)
#   end
# }
# -------------
# But wanted the names to appear!
