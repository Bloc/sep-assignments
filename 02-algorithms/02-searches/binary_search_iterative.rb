def binary_search(sorted_array, value)
  collection_size = sorted_array.length - 1
  low = 0
  high = collection_size

  while low <= high
    mid = (low + high) / 2
    if sorted_array[mid] > value
      high = mid - 1
    elsif sorted_array[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return "Not found"
end
