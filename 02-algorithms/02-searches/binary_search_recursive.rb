def binary_search(sorted_array, value)
  high = sorted_array.length - 1
  low = 0
  mid = (high + low) / 2

  if sorted_array.empty?
    return "Not found"
  end

  if sorted_array[mid] == value
    return sorted_array[mid]
  elsif sorted_array[mid] < value
    binary_search(sorted_array.slice(mid + 1..high), value)
  elsif sorted_array[mid] > value
    binary_search(sorted_array.slice(0..mid - 1), value)
  end
end
