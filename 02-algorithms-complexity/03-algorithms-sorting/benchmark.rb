require 'benchmark'
require 'quick_sort'
require 'heap_sort'
require 'bucket_sort'

#build random array dynamically with rand method

array = [11,17,41,34,29,5,48,10,47,2,1,16,36,21,39,4,13,23,12,20,25,42,22,37,46,8,49,9,38,33,30,3,45,40,14,7,24,19,43,27,44,31,15,35,26,32,28,50,18,6]

Benchmark.bm(20) do |x|
  x.report('Quick Sort') {quick_sort(array)}
  # x.report('Heap Sort') {heap_sort(array)}
  # x.report('Bucked Sort') {bucket_sort(array)}
  # add Ruby's sort method array.sort
  # add additonal methods from checkpoint
end
