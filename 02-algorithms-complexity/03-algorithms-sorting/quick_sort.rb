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

# test_array = (1..50).to_a.shuffle
# puts quick_sort(test_array)
