def heapsort(array)
  size = array.length - 1
  sorted_array = array

  (size / 2).downto(0) do |index|
      heapify(sorted_array, index, size)
  end

  while size > 0
      sorted_array[0], sorted_array[size] = sorted_array[size], sorted_array[0]
      size -= 1
      heapify(sorted_array, 0, size)
  end
  return sorted_array
end

def heapify(array, parent, size)
  root = array[parent]
  while (child = 2 * parent) <= size do
    child += 1 if child < size && array[child] < array[child + 1]
    break if root >= array[child]
    array[parent], parent = array[child], child
  end
  array[parent] = root
end


array1 = [9, 21, 10, 4, 76, 100]
# array2 = [1, 2, 3, 4, 5]
# array3 = [23, 9, 8, 2, 1]
# array4 = [-1, 0, -3333333, -9999, 21212, 547]
#
puts 'Array 1'
puts heapsort(array1)
# puts 'Array 2'
# puts heapsort(array2)
# puts 'Array 3'
# puts heapsort(array3)
# puts 'Array 4'
# puts heapsort(array4)


# require 'benchmark'
#
# puts "The heap sort speed is:"
# puts Benchmark.measure {
#    heapsort(array)
# }
