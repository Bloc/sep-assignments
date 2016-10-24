require 'benchmark'
require './checkpoint'
require './quick_sort'
require './heap_sort'
require './bucket_sort'

#build random array dynamically with rand method

array = (1..50).to_a.shuffle

Benchmark.bm(20) do |x|
  x.report('Quick Sort') {quick_sort(array)}
  x.report('Heap Sort') {heap_sort(array)}
  x.report('Bucked Sort') {bucket_sort(array)}
  # add Ruby's sort method array.sort
  x.report('Ruby Sort') {array.sort}
  # add additonal methods from checkpoint
  x.report('Insertion Sort') {insertion_sort(array)}
  x.report('Selection Sort') {selection_sort(array)}
  x.report('Bubble Sort') {bubble_sort(array)}
  x.report('Merge Sort') {merge_sort(array)}
end
