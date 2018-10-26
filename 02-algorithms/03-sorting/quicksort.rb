def quicksort(array, first = 0, last = nil)
  last = array.length-1 if last == nil
  return array if first >= last

  pivot = first
  ((pivot + 1)..last).each do |index|
    if array[index] < array[pivot]
        temp = array[index]
        array[index] = array[pivot + 1]
        array[pivot + 1] = array[pivot]
        array[pivot] = temp
        pivot += 1
    end
  end

  quicksort(array, first, (pivot - 1))
  quicksort(array, (pivot + 1), last)

  return array
end

array = [9, 21, 10, 4, 76, 100]

puts quicksort(array)

# require 'benchmark'
#
# puts "The quick sort speed is:"
# puts Benchmark.measure {
#    quicksort(array)
# }
