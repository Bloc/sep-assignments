require_relative 'min_heap'

#sorts elements in ascending order using a MinHeap, returns ordered array
def asc_heap_sort(arr)
  ordered_arr = []
  #build a heap with the array passed in
  min_heap = MinHeap.new(arr)
  #delete root node and place in new array, repeat until all elements have been removed from heap
  arr.size.times { ordered_arr << min_heap.delete_root }
  #return ordered_arr
  ordered_arr
end
