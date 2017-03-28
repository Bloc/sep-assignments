require 'benchmark'
require_relative 'heap_sort'
require_relative 'quick_sort'
require_relative 'bucket_sort'
include Benchmark

Benchmark.benchmark(CAPTION, 7, FORMAT, ">avg:") do |x|
	t1 = x.report("Heap Sort: ") { 
		heap_array = HeapArray.new
		heap_array.read_file("random_numbers.txt")
		heap_array.heap_sort 
		# heap_array.print
	} 
	t2 = x.report("Quick Sort: ") { 
		quick_array = QuickArray.new
		quick_array.read_file("random_numbers.txt")
		quick_array.quick_sort 
		# quick_array.print
	} 
	t3 = x.report("Bucket Sort: ") { 
		bucket_array = BucketArray.new
		bucket_array.read_file("random_numbers.txt")
		bucket_array.bucket_sort 
		# bucket_array.print
	} 
end