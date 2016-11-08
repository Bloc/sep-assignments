def time_optimized_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    #replace nested loop w/ single line to combine each array into combined_array
    combined_array.concat(array)
  end

  sorted_array = quick_sort(combined_array)
end


def quick_sort(array)
  return array if array.length <= 1

  pivot = array.length - 1

  small_array = []
  big_array = []
  sorted_array = []

  for x in 0...pivot
    if array[x] >= array[pivot]
      big_array << array[x]
    else
      small_array << array[x]
    end
  end

  if small_array.length > 0
    sorted_array.concat(quick_sort(small_array))
  end
    sorted_array << array[pivot]

  if big_array.length > 0
    sorted_array.concat(quick_sort(big_array))
  end
  sorted_array
end

# array1 = []
# array2 = []
# array3 = []
#
# 5.times do |x|
#   array1 << rand(100)
#   array2 << rand(100)
#   array3 << rand(100)
# end
#
# test = time_optimized_ruby(array1, array2, array3)
# puts test
